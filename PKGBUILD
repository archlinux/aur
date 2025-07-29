# Maintainer: shtrophic <aur at shtrophic dot net>
# Contributor: Nebulosa <nebulosa2007-at-yandex-dot-ru>

_pkgname=xwayland-satellite
pkgname="$_pkgname-git"
pkgver=0.6.r19.gba78881
pkgrel=2
pkgdesc="Xwayland outside your Wayland - git version"
arch=(x86_64)
url="https://github.com/Supreeeme/$_pkgname"
license=(MPL-2.0)
depends=(
	gcc-libs
	glibc
	libxcb
	xcb-util-cursor
	xorg-xwayland
)
makedepends=(
	git
	clang
	rust
)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_HOME="$srcdir"/.cargo
	sed 's|/usr/local|/usr|' -i resources/$_pkgname.service
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_HOME="$srcdir"/.cargo
	export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --features systemd
}

check() {
	cd $_pkgname
	export XDG_RUNTIME_DIR="$(mktemp -d)"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	install -Dm644 $_pkgname/resources/$_pkgname.service -t "$pkgdir"/usr/lib/systemd/user/
	install -Dm755 $_pkgname/target/release/$_pkgname -t "$pkgdir"/usr/bin/
}
