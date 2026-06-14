#!/bin/bash -e
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

_pkgname=squawk
pkgname="${_pkgname}-cli"
pkgver=2.58.0
pkgrel=1
pkgdesc="Linter for PostgreSQL, focused on migrations"
arch=(
	x86_64
)
url=https://squawkhq.com/
license=(
	"Apache-2.0 OR MIT"
)
makedepends=(
	cargo
	glibc
	libgcc
	openssl
)
options=(
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/sbdchd/squawk/archive/refs/tags/v${pkgver}.tar.gz"
	use-system-openssl.patch
)
sha256sums=('b3e13bd2f6e2cde6e6c97d73f5d86b72a158ad4621546e3c3b52090342e8f707'
            'd524c128516732626fa14acff4ce74de3fcb275405a89130a0d5857d23b3c447')

: "${pkgname}"
: "${pkgver}"
: "${pkgrel}"
: "${pkgdesc}"
: "${arch[@]}"
: "${url}"
: "${license[@]}"
: "${depends[@]}"
: "${makedepends[@]}"
: "${options[@]}"
: "${source[@]}"
: "${sha256sums[@]}"

_list_packages_for_removal() {
	cargo tree \
		--all-features \
		--depth 1 \
		--package "${_pkgname}" \
		--prefix none \
		"$@" |
		tail -n +2 |
		cut -d " " -f 1 |
		grep -Fvx snapbox
}

_remove_packages() {
	xargs cargo remove \
		--offline \
		--package "${_pkgname}" \
		"$@"
}

prepare() {
	cd "${_pkgname}-${pkgver}"

	patch -i ../use-system-openssl.patch

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch \
		--locked \
		--target host-tuple
}

build() {
	cd "${_pkgname}-${pkgver}"

	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable

	cargo build \
		--all-features \
		--bin "${_pkgname}" \
		--frozen \
		--release
}

check() {
	cd "${_pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable

	# Skip rebuilding the executable.
	# https://github.com/rust-lang/cargo/issues/12980
	find "crates/${_pkgname}/src" -name "*.rs" -delete
	sed -i '/^default-run = "squawk"$/d' "crates/${_pkgname}/Cargo.toml"
	# Skip rebuilding the dependencies.
	_list_packages_for_removal --edges no-dev | _remove_packages
	_list_packages_for_removal --edges dev | _remove_packages --dev
	# Test against the release executable.
	declare "CARGO_BIN_EXE_${_pkgname}=${PWD:?}/target/release/${_pkgname}"
	export "CARGO_BIN_EXE_${_pkgname}"

	cargo test \
		--all-features \
		--frozen \
		--package "${_pkgname}" \
		--test '*'
}

package() {
	depends=(
		glibc
		libcrypto.so
		libgcc_s.so
		libssl.so
	)

	: "${depends[@]}"
	: "${pkgdir:?}"

	cd "${_pkgname}-${pkgver}"

	install -Dm0755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 {.,"${pkgdir}/usr/share/licenses/${pkgname}"}/LICENSE-MIT
}
