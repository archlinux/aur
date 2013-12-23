# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=slim-xdm
_pkgname=slim
pkgver=1.3.6.9
pkgrel=1
pkgdesc="Desktop-independent graphical login manager for X11 with XDM support"
arch=('i686' 'x86_64')
url="http://slim.berlios.de/"
license=('GPL2')
depends=('libjpeg' 'libxft' 'libxrandr' 'xorg-xauth')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
replaces=($_pkgname 'wdm-slim')
makedepends=('git' 'cmake' 'freeglut')
backup=('etc/slim.conf' 'etc/logrotate.d/slim' 'etc/pam.d/slim'
        'etc/slimlock.conf')
source=($pkgname::git://github.com/bbidulock/$_pkgname.git
        slim.pam
        slim.logrotate)
sha256sums=('SKIP'
            'b9a77a614c451287b574c33d41e28b5b149c6d2464bdb3a5274799842bca51a4'
            '5bf44748b5003f2332d8b268060c400120b9100d033fa9d35468670d827f6def')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's|v||;s|-|.|g;s|[.]g[a-f0-9]*$||'
}

build() {
  cd $pkgname
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_PAM=yes \
    -DUSE_CONSOLEKIT=no
	make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/slim.pam" "$pkgdir/etc/pam.d/slim"
  install -Dm644 "$srcdir/slim.logrotate" "$pkgdir/etc/logrotate.d/slim"
}

# vim:set ts=2 sw=2 et:
