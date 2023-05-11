# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=archy-dwm-git
_pkgname=archy-dwm
pkgver=1.0.0.r1.gfeb819c
pkgrel=1
pkgdesc="A dynamic window manager for X with some patches applied"
url="https://github.com/archy-linux/$_pkgname"
arch=('i686' 'x86_64')
license=('MIT')
options=()
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'archy-slstatus-git' 'archy-dmenu-git')
makedepends=('git' 'make')
install=
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver(){
  cd $_pkgname || exit 1
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname || exit 1
  make archy-dwm.desktop
}

build() {
  cd $_pkgname || exit 1
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $_pkgname || exit 1
  # shellcheck disable=SC2154
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 -D build/archy-dwm.desktop "$pkgdir/usr/share/xsessions/archy-dwm.desktop"
}
