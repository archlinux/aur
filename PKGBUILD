# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: <kleptophobiac@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=mythtv-git
pkgver=29+fixes.20181210.362f3829
pkgrel=1
pkgdesc="A Homebrew PVR project"
arch=('x86_64')
url="https://www.mythtv.org/"
license=('GPL')
depends=('libass' 'qt5-script' 'libavc1394' 'fftw' 'exiv2' 'taglib' 'libva' 'libiec61883' 'perl-net-upnp' 'urlgrabber'
         'qt5-webkit' 'x265' 'libx264' 'jack' 'libvpx' 'libvdpau' 'lame' 'libxinerama' 'libpulse' 'libxrandr' 'mysql-python')
makedepends=('git' 'help2man' 'yasm' 'libmariadbclient' 'libxml2' 'libcec' 'x264' 'libcdio' 'lirc' 'perl-io-socket-inet6' 'perl-libwww'
             'perl-dbd-mysql' 'python2-lxml')
optdepends=('glew: for GPU commercial flagging'
            'libcec: for consumer electronics control capabilities'
            'libxml2: to read blu-ray metadata'
            'mariadb: Database-Backend for server deployment'
            'mariadb-clients: Database-Frontend for client deployment'
            'python2-future: for metadata-lookup / cover art'
            'python2-requests: for metadata-lookup / cover art'
            'python2-requests-cache: for metadata-lookup / cover art')
conflicts=('myththemes' 'mythplugins-mythvideo' 'mythtv')
replaces=('myththemes' 'mythplugins-mythvideo' 'mythtv')
source=("git+https://github.com/MythTV/mythtv#branch=fixes/29"
        'mythbackend.service'
        '99-mythbackend.rules'
        'sysusers.d')
sha256sums=('SKIP'
            'ed5ca54de26b7cd8a64e09626eed6e09f35d677daf88c530bb24cc4252bcce6d'
            'ecfd02bbbef5de9773f4de2c52e9b2b382ce8137735f249d7900270d304fd333'
            '470de0a4050c16c7af11a0e5cfe2810b7daae42df4acf5456c7eae274dc7c5ae')

pkgver() {
  cd "${srcdir}/mythtv/mythtv"
  echo -n "29+fixes.$(git show -s --format=%cd --date=short | tr -d -).$(git rev-parse --short=8 HEAD)"
}

prepare() {
  cd "${srcdir}/mythtv/mythtv"

  find 'bindings/python' 'contrib' 'programs/scripts' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
  cd "${srcdir}/mythtv/mythtv"

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
  cd "${srcdir}/mythtv/mythtv"
  make INSTALL_ROOT="$pkgdir" install

  install -D -m644 "$srcdir/mythbackend.service" "$pkgdir/usr/lib/systemd/system/mythbackend.service"
  install -D -m644 'database/mc.sql' "$pkgdir/usr/share/mythtv/mc.sql"
  install -D -m644 "$srcdir/sysusers.d" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  mkdir -p "$pkgdir/usr/share/mythtv"
  cp -R 'contrib' "$pkgdir/usr/share/mythtv"
  mkdir -p "$pkgdir/var/log/mythtv"

# Install udev rules https://www.mythtv.org/wiki/Systemd_mythbackend_Configuration#Delay_starting_the_backend_until_tuners_have_initialized
  install -Dm644 "$srcdir/99-mythbackend.rules" "$pkgdir/usr/lib/udev/rules.d/99-mythbackend.rules"
}
