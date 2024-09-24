#!/bin/bash -e
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

_pkgname=squawk
pkgname="${_pkgname}-cli"
pkgver=1.4.0
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
	"libpg_query>=16"
)
makedepends=(
	cargo
	jq
)
options=(
	'!lto'
)
source=(
	"https://github.com/sbdchd/squawk/archive/refs/tags/v${pkgver}.tar.gz"
	dynamic-pg_query-linking.patch
	libpg_query-sys.patch
)
sha256sums=(
	7727bce555638448d1be26f6dd49eede89250b04873eeb4593a32da42bc6d814
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

prepare() {
	cd "${_pkgname}-${pkgver}"

	patch -p0 -i ../libpg_query-sys.patch

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
	cd "${_pkgname}-${pkgver}"

	export CARGO_TARGET_DIR=target
	export LIBPG_QUERY_PATH=/usr
	export RUSTUP_TOOLCHAIN=stable

	cargo build --frozen --release --all-features
}

check() {
	cd "${_pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable

	cargo test --frozen --all-features
}

package() {
	: "${pkgdir:?}"

	cd "${_pkgname}-${pkgver}"

	install -Dm0755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
