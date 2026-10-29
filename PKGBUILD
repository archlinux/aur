#!/hint/bash -e
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

_pkgname=squawk
pkgname="${_pkgname}-cli"
pkgver=2.71.0
pkgrel=1
pkgdesc="Linter for PostgreSQL, focused on migrations"
arch=(x86_64)
url=https://squawkhq.com/
license=(
	"Apache-2.0 OR MIT"
)
depends=(
	glibc
)
makedepends=(
	cargo
)
options=(
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/sbdchd/squawk/archive/refs/tags/v${pkgver}.tar.gz"
	prevent-rebuild.patch
	use-system-openssl.patch
)
sha256sums=('375082537f4cc9cd431dd8d0cb3801bc988f35d8b0ec172951f927bb64dc086d'
            'e63a32b66331fe4b8952b6e4e9153cb3c8789a5e1229353e7c25f1271bd4d14e'
            'd524c128516732626fa14acff4ce74de3fcb275405a89130a0d5857d23b3c447')

declare -gA _depends=(
	[libgcc]="libgcc_s.so"
	[openssl]="libcrypto.so libssl.so"
)
makedepends+=(
	"${!_depends[@]}"
)

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

	export CARGO_HOME="${PWD}"
	export RUSTUP_TOOLCHAIN=stable

	cargo fetch \
		--locked \
		--target host-tuple

	chmod -R +r registry/src
}

build() {
	cd "${_pkgname}-${pkgver}"

	# Set all the Cargo-related environment variables the way they are proposed
	# in RFC69.
	# c.f. https://gitlab.archlinux.org/archlinux/rfcs/-/merge_requests/69
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export CARGO_PROFILE_RELEASE_STRIP=false

	export CARGO_HOME="${PWD}"
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

	export CARGO_HOME="${PWD}"
	export RUSTUP_TOOLCHAIN=stable

	# Skip rebuilding the executable.
	# https://github.com/rust-lang/cargo/issues/12980
	patch -p0 -i ../prevent-rebuild.patch
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
	# shellcheck disable=SC2206
	depends+=(
		${_depends[@]}
	)

	: "${pkgdir:?}"

	cd "${_pkgname}-${pkgver}"

	install -Dm0755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 {.,"${pkgdir}/usr/share/licenses/${pkgname}"}/LICENSE-MIT
}

: "${arch[@]}"
: "${license[@]}"
: "${makedepends[@]}"
: "${options[@]}"
: "${pkgdesc}"
: "${pkgname}"
: "${pkgrel}"
: "${pkgver}"
: "${sha256sums[@]}"
: "${source[@]}"
: "${url}"
