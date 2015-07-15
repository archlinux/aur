# Maintainer: Vincent Quilin <archpkg@cybervince.fr>

pkgname=slim-synergy
pkgver=1.3.5
pkgrel=1
pkgdesc="Desktop-independent graphical login manager for X11 with synergy support"
arch=('i686' 'x86_64')
url="http://slim.berlios.de/"
license=('GPL2')
depends=('pam' 'libxmu' 'libpng' 'libjpeg' 'libxft' 'xorg-xauth' 'synergy')
makedepends=('cmake' 'freeglut')
conflicts=('slim')
provides=('slim')
backup=('etc/slim.conf' 'etc/logrotate.d/slim' 'etc/pam.d/slim')
source=(http://download.berlios.de/slim/slim-$pkgver.tar.gz
        slim.pam
        slim.logrotate
        synergy-support.patch)
sha256sums=('818d209f51e2fa8d5b94ef75ce90a7415be48b45e796d66f8083a9532b655629'
            'b9a77a614c451287b574c33d41e28b5b149c6d2464bdb3a5274799842bca51a4'
            '5bf44748b5003f2332d8b268060c400120b9100d033fa9d35468670d827f6def'
            '15cecdd15c377a618542ddd7211c8ac5cff0c8996c29b19462e84376a02887de')
build() {
  cd "$srcdir/slim-$pkgver"

  # Add support for synergy
  patch -p1 < ../synergy-support.patch

  # Fix installation path of slim.service
  sed -i 's|usr/lib/systemd/system|/&|' CMakeLists.txt

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_PAM=yes \
    -DUSE_CONSOLEKIT=no
  make
}

package() {
  cd "$srcdir/slim-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/slim.pam" "$pkgdir/etc/pam.d/slim"
  install -Dm644 "$srcdir/slim.logrotate" "$pkgdir/etc/logrotate.d/slim"

  # Provide sane defaults
  sed -i -e 's|#xserver_arguments.*|xserver_arguments -nolisten tcp vt07|' \
         -e 's|/var/run/slim.lock|/var/lock/slim.lock|' \
    "$pkgdir/etc/slim.conf"
}

# vim:set ts=2 sw=2 et:
