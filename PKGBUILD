# Maintainer: Morgana <morganamilo@gmail.com>

pkgname=stgl-git
_pkgname=stgl
pkgver='r1000.35fd0f5'
pkgrel=2
pkgdesc='(ex) simple terminal (OpenGL edition!)'
arch=('x86_64')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc' 'adobe-source-code-pro-fonts' 'glm')
conflicts=('st')
makedepends=('ncurses')
url="https://github.com/bobtwinkles/stgl"
source=(git+https://github.com/bobtwinkles/${_pkgname})
md5sums=('SKIP')

prepare() {
  cd $srcdir/$_pkgname
  # skip terminfo which conflicts with nsurses
  sed -i '/tic /d' Makefile
}

build() {
  cd $srcdir/$_pkgname
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
