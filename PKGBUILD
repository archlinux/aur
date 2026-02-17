# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Shader script tester for Vulkan'
pkgname=vkrunner-git
pkgver=r649.b327697
pkgrel=1
url=https://gitlab.freedesktop.org/mesa/vkrunner
arch=(x86_64)
license=(Apache-2.0 MIT)
conflicts=(vkrunner)
provides=(vkrunner)
depends=(glslang)
makedepends=(cargo git vulkan-headers)
source=("${pkgname}::git+${url}.git")
sha512sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target host-tuple
}

build () {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --offline --release --all-features
}

check () {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --offline --all-features
}

package () {
	cd "$pkgname"
	install -Dm755 target/release/vkrunner "$pkgdir/usr/bin/vkrunner"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
