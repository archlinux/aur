# Maintainer: Luis Pérez <luis dot perez at proton dot me>
pkgname=sarge-git
_pkgname=sarge
pkgver=r36.d267056
pkgrel=1
pkgdesc=""
arch=(any)
url="https://github.com/RedDocMD/Sarge"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'cargo' 'dbus')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('sarge::git+https://github.com/RedDocMD/Sarge.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
	cd "$srcdir/${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
}
