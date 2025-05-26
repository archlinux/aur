#!/bin/bash -e
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

_pkgname=squawk
pkgname="${_pkgname}-cli"
pkgver=2.9.0
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
)
makedepends=(
	cargo
)
options=(
	'!lto'
)
source=(
	"https://github.com/sbdchd/squawk/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
	49ae86bb44af731ff0fc886370ef9e87fd2e7efa763ab9561e57f7e77a39cb0e
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
}

build() {
	cd "${_pkgname}-${pkgver}"

	export CARGO_TARGET_DIR=target
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
