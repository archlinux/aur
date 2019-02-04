# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: <kleptophobiac@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=mythtv
pkgver=30.0
pkgrel=4
epoch=1
pkgdesc="A Homebrew PVR project"
arch=('x86_64')
url="https://www.mythtv.org/"
license=('GPL')
depends=('libass' 'qt5-script' 'libavc1394' 'fftw' 'exiv2' 'taglib' 'libva' 'libiec61883' 'perl-net-upnp' 'urlgrabber' 'libsamplerate'
         'qt5-webkit' 'x265' 'x264' 'jack' 'libvpx' 'libvdpau' 'lame' 'libxinerama' 'libpulse' 'libxrandr' 'mysql-python' 'libxnvctrl' 'libhdhomerun')
makedepends=('git' 'help2man' 'yasm' 'mariadb-libs' 'libxml2' 'libcec' 'libcdio' 'lirc' 'perl-io-socket-inet6' 'perl-libwww'
             'perl-dbd-mysql' 'python2-lxml' 'perl-xml-simple' 'perl-xml-xpath')
optdepends=('glew: for GPU commercial flagging'
            'libcec: for consumer electronics control capabilities'
            'libxml2: to read blu-ray metadata'
            'libhdhomerun: to work properly with HDHomerun devices'
            'mariadb: Database-Backend for server deployment'
            'mariadb-clients: Database-Frontend for client deployment'
            'python2-future: for metadata-lookup / cover art'
            'python2-requests: for metadata-lookup / cover art'
            'python2-requests-cache: for metadata-lookup / cover art')
conflicts=('myththemes' 'mythplugins-mythvideo')
replaces=('myththemes' 'mythplugins-mythvideo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MythTV/$pkgname/archive/v$pkgver.tar.gz"
        'mythbackend.service'
        '99-mythbackend.rules'
        'sysusers.d'
)
sha256sums=('7f7ae9b8927659616f181afc12d7ddc26b0a4b0d13982e2586985f4770640b43'
            '086f573884e4df1ff6e6e8de5a423a9ff900166acfe085abe65b62f32730e4a3'
            'ecfd02bbbef5de9773f4de2c52e9b2b382ce8137735f249d7900270d304fd333'
            '470de0a4050c16c7af11a0e5cfe2810b7daae42df4acf5456c7eae274dc7c5ae')

prepare() {
  cd $pkgname-$pkgver/$pkgname

  find 'bindings/python' 'contrib' 'programs/scripts' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
  cd $pkgname-$pkgver/$pkgname

  ARCH="${CARCH/_/-}"
  ./configure --prefix=/usr \
              --cpu="$ARCH" \
              --disable-altivec \
              --enable-audio-jack \
              --disable-distcc \
              --enable-libfftw3 \
              --enable-libmp3lame \
              --enable-libvpx \
              --enable-libx264 \
              --enable-libx265 \
              --enable-vaapi \
              --python=python2 \
              --perl-config-opts=INSTALLDIRS=vendor
  make
}

package() {
  cd $pkgname-$pkgver/$pkgname
  make INSTALL_ROOT="$pkgdir" install

  install -D -m644 "$srcdir/mythbackend.service" "$pkgdir/usr/lib/systemd/system/mythbackend.service"
  install -D -m644 'database/mc.sql' "$pkgdir/usr/share/mythtv/mc.sql"
  install -D -m644 "$srcdir/sysusers.d" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

#  mkdir -p "$pkgdir/usr/share/mythtv"
  cp -R 'contrib' "$pkgdir/usr/share/mythtv"
  mkdir -p "$pkgdir/var/log/mythtv"

# Install udev rules https://www.mythtv.org/wiki/Systemd_mythbackend_Configuration#Delay_starting_the_backend_until_tuners_have_initialized
  install -Dm644 "$srcdir/99-mythbackend.rules" "$pkgdir/usr/lib/udev/rules.d/99-mythbackend.rules"
}
