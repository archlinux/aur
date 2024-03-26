#!/bin/bash -e
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

_commit=9ac8190d2b71ef5f65f4a7d5006e10ab02988b0c
_pkgname=squawk
pkgname="${_pkgname}-cli"
pkgver=0.28.0.r3.g9ac8190
pkgrel=1
pkgdesc="Linter for PostgreSQL, focused on migrations"
arch=(
	x86_64
)
url=https://squawkhq.com/
license=(
	GPL-3.0-only
)
depends=(
	libpg_query
)
makedepends=(
	cargo
	git
	jq
)
options=(
	'!lto'
)
source=(
	"${_pkgname}::git+https://github.com/sbdchd/squawk.git#commit=${_commit}"
	dynamic-pg_query-linking.patch
)
sha256sums=(
	SKIP
	SKIP
)

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

pkgver() {
	cd "${_pkgname}"

	git describe --long --tags --abbrev=7 \
		| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

	mkdir -p .cargo
	cargo vendor --locked > .cargo/config.toml

	patch -p0 -i ../dynamic-pg_query-linking.patch
	BUILD_RS_SHA256="$(sha256sum vendor/libpg_query-sys/build.rs)"
	jq ".files[\"build.rs\"] = \"${BUILD_RS_SHA256%% *}\"" \
		vendor/libpg_query-sys/.cargo-checksum.json \
		> vendor/libpg_query-sys/.cargo-checksum.json.new
	mv vendor/libpg_query-sys/.cargo-checksum.json{.new,}
}

build() {
	cd "${_pkgname}"

	export CARGO_TARGET_DIR=target
	export LIBPG_QUERY_PATH=/usr
	export RUSTUP_TOOLCHAIN=stable

	cargo build --frozen --release --all-features
}

check() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable

	cargo test --frozen --all-features
}

package() {
	: "${pkgdir:?}"

	cd "${_pkgname}"

	install -Dm0755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
