# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: <kleptophobiac@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=mythtv
pkgver=29.1
pkgrel=8
epoch=1
pkgdesc="A Homebrew PVR project"
arch=('x86_64')
url="https://www.mythtv.org/"
license=('GPL')
depends=('libass' 'qt5-script' 'libavc1394' 'fftw' 'exiv2' 'taglib' 'libva' 'libiec61883' 'perl-net-upnp' 'urlgrabber'
         'qt5-webkit' 'x265' 'libx264' 'jack' 'libvpx' 'libvdpau' 'lame' 'libxinerama' 'libpulse' 'libxrandr')
makedepends=('git' 'help2man' 'yasm' 'libmariadbclient' 'libxml2' 'libcec' 'x264' 'libcdio' 'lirc' 'perl-io-socket-inet6' 'perl-libwww' 'mysql-python'
             'perl-dbd-mysql' 'python2-lxml')
optdepends=('glew: for GPU commercial flagging'
            'libcec: for consumer electronics control capabilities'
            'libxml2: to read blu-ray metadata'
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
        'freetype2.patch')
sha256sums=('e40ec8111d39fd059a9ec741b10016683bcc66ee3b33c4cdaab93d60851f5d3e'
            'ed5ca54de26b7cd8a64e09626eed6e09f35d677daf88c530bb24cc4252bcce6d'
            'ecfd02bbbef5de9773f4de2c52e9b2b382ce8137735f249d7900270d304fd333'
			'470de0a4050c16c7af11a0e5cfe2810b7daae42df4acf5456c7eae274dc7c5ae'
            '4451cbb28513e03cc2f62c50581daeb436d027f8a0968ba5d99a3b05da103343')

prepare() {
  cd $pkgname-$pkgver/$pkgname

  find 'bindings/python' 'contrib' 'programs/scripts' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  #apply freetype2.patch to fix configure error
  patch -Np1 -i ../../freetype2.patch
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
