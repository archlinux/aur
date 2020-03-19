# Maintainer: thorsten w. <p@thorsten-wissmann.de>
# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=herbstluftwm-git
_pkgname=herbstluftwm
pkgver=0.7.2.r852.g031c5ce4
pkgrel=4
pkgdesc="Manual tiling window manager for X"
arch=('i686' 'x86_64')
url="http://herbstluftwm.org"
license=('BSD')
depends=('libx11' 'libxinerama')
optdepends=(
        'bash: needed by most scripts'
        'xterm: used by the default autostart'
        'dmenu: needed by some scripts'
        'dzen2: needed by panel.sh'
        'dzen2-xft-xpm-xinerama-git: view icons as tags'
    )
makedepends=('git' 'asciidoc' 'cmake')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git://github.com/herbstluftwm/$_pkgname")
md5sums=( SKIP )

pkgver() {
  cd $_pkgname
  git describe --tags --long | sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  rm -r build || true
  mkdir build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../$_pkgname
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  cd "$srcdir/$_pkgname"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
