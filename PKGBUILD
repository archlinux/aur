# Maintainer: Frantisek Fladung

_pkgname=dmenu
pkgname=$_pkgname-ametisf-git
pkgver=544.49fd8a0
pkgrel=1
pkgdesc="Wayland port of dmenu - ametisf fork"
url="https://github.com/ametisf/dmenu"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'wld')
makedepends=('git' 'libx11' 'swc')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/ametisf/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count wayland).$(git rev-parse --short wayland)
}

prepare() {
  cd $srcdir/$_pkgname
  # to use a custom config.h, place it in the package directory
  if [[ -f ${SRCDEST}/config.h ]]; then
      cp "${SRCDEST}/config.h" .
  fi
}

build(){
  cd $srcdir/$_pkgname
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
