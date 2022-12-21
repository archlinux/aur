# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
pkgname=rl_custom_function-git
_pkgname=${pkgname%-git}
pkgver=r23.76bce87
pkgrel=1
pkgdesc="Enable to inject custom functions into any readline applications"
arch=('i686' 'x86_64')
url="https://github.com/lincheney/rl_custom_function"
license=('GPL3')
depends=('readline')
makedepends=('rust' 'cargo')
provides=("$_pkgname")
install=$pkgname.install
source=("$_pkgname::git+https://github.com/lincheney/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
  touch main.c
  gcc -m32 -shared main.c -o librl_custom_function.so
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 target/release/librl_custom_function.so $pkgdir/usr/lib/librl_custom_function.so
  install -D -m644 README.md $pkgdir/usr/share/doc/$_pkgname/README.md
  install -D -m644 librl_custom_function.so $pkgdir/usr/lib32/librl_custom_function.so
}
