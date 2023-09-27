# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Kornel Lesiński <kornel@geekhood.net>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname='dupe-krill'
pkgver=1.4.9
pkgrel=1
pkgdesc='A fast file deduplicator to replace files with identical content with hardlinks.'
arch=('x86_64' 'aarch64')
url="https://github.com/kornelski/${pkgname}"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('dd935f4c868f8e1f995007a3a934060dd8d2a90908be54a39482eef46befaf58464454dfad3a76d1caaba9239b990da3a333f2cf879865eb120a3030bd1445b9')

prepare() {
	cd "${pkgname}-${pkgver}"
	export CARGO_TARGET_DIR=target
	export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"
	export CARGO_TARGET_DIR=target
	export CARGO_INCREMENTAL=0

	cargo build --frozen --release --all-features
}

check() {
	cd "${pkgname}-${pkgver}"
	export CARGO_INCREMENTAL=0

	cargo test --frozen --workspace
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
	install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
}
