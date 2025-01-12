#!/bin/bash -e
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

_pkgname=squawk
pkgname="${_pkgname}-cli"
pkgver=1.5.3
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
)
sha256sums=(
	7c73921c5fd23f6990e80ad7022023a58be69d4d2bec821c3df3d5c2f72bcc73
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
