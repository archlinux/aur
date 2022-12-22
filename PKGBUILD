# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=noseyparker-git
_pkgname_root="${pkgname%-git}"
pkgver=r17.9438ab2
pkgrel=1
pkgdesc="find secrets and sensitive information in textual data and Git history"
arch=(any)
url="https://github.com/praetorian-inc/noseyparker"
license=('Apache-2')
makedepends=('git'
						 'cargo')
depends=(hyperscan)
source=("${_pkgname_root}::git+https://github.com/praetorian-inc/${_pkgname_root}.git")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/${_pkgname_root}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname_root}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${_pkgname_root}"
	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${_pkgname_root}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname_root"
}
