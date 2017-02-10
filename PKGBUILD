# Maintainer: Andrew Conrad <aconrad103@gmail.com>
# Contributor:  Håvard Pettersson <mail@haavard.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

_pkgname=dmenu
pkgname=$_pkgname-wayland-git
pkgver=503.6e08b77
pkgrel=1
pkgdesc="Wayland port of a generic menu for X"
url="https://github.com/michaelforney/dmenu"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'wld')
makedepends=('git' 'libx11' 'swc-git')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git://github.com/michaelforney/$_pkgname)
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
