# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
# Contributor: Wu Zhenyu <wuzhenyu@ustc.edu>

pkgname=rl_custom_function-git
_pkgname=${pkgname%-git}
pkgver=r30.398f757
pkgrel=2
pkgdesc="Enable to inject custom functions into any readline applications"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/lincheney/rl_custom_function"
license=('GPL3')
depends=('readline')
makedepends=('cargo' 'git' 'lib32-gcc-libs')
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
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
  # https://github.com/lincheney/rl_custom_isearch/issues/4
  if [[ $CARCH == x86_64 ]]; then
    gcc -m32 -shared /dev/null -o fake_lib32_librl_custom_function.so
  fi
}

check() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 target/release/librl_custom_function.so $pkgdir/usr/lib/librl_custom_function.so
  install -D -m644 README.md $pkgdir/usr/share/doc/$_pkgname/README.md
  if [[ $CARCH == x86_64 ]]; then
    install -D -m644 fake_lib32_librl_custom_function.so $pkgdir/usr/lib32/librl_custom_function.so
  fi
}
