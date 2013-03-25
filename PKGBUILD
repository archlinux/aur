# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=slim-xdm
_pkgname=slim
pkgver=1.3.5
pkgrel=20
pkgdesc="Desktop-independent graphical login manager for X11 with XDM support"
arch=('i686' 'x86_64')
url="http://slim.berlios.de/"
license=('GPL2')
depends=('pam' 'libxmu' 'libpng' 'libjpeg' 'libxft' 'xorg-xauth')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
replaces=($_pkgname 'wdm-slim')
makedepends=('cmake' 'freeglut')
backup=('etc/slim.conf' 'etc/logrotate.d/slim' 'etc/pam.d/slim')
source=(http://download.berlios.de/$_pkgname/$_pkgname-$pkgver.tar.gz
        slim.pam
        slim.logrotate
        slim.patch)
sha256sums=('818d209f51e2fa8d5b94ef75ce90a7415be48b45e796d66f8083a9532b655629'
            'b9a77a614c451287b574c33d41e28b5b149c6d2464bdb3a5274799842bca51a4'
            '5bf44748b5003f2332d8b268060c400120b9100d033fa9d35468670d827f6def'
            '43a6ea707d5273a1a7cb1d03b21ee2dc617a16d85d0616e4a4824b5c7c826e06')

build() {
  cd "$srcdir"
  patch -p0 <slim.patch
  cd "$srcdir/$_pkgname-$pkgver"

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
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/slim.pam" "$pkgdir/etc/pam.d/slim"
  install -Dm644 "$srcdir/slim.logrotate" "$pkgdir/etc/logrotate.d/slim"

  # Provide sane defaults
  sed -i -e 's|#xserver_arguments.*|xserver_arguments -nolisten tcp vt07|' \
         -e 's|/var/run/slim.lock|/var/lock/slim.lock|' \
    "$pkgdir/etc/slim.conf"
}

makepatch() {
  diff -purN ${_pkgname}-${pkgver}.orig ${_pkgname}-${pkgver} >${_pkgname}.patch
  makepkg -c -g >>PKGBUILD
}

# vim:set ts=2 sw=2 et:
