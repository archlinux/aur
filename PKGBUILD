# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Kornel Lesiński <kornel@geekhood.net>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname='dupe-krill'
pkgver=1.5.0
pkgrel=1
pkgdesc='An incremental file deduplicator to replace files with identical content with hardlinks or reflinks.'
arch=('x86_64' 'aarch64')
url="https://github.com/kornelski/${pkgname}"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('668182b837f94c4f90d1d69afc32c221305313cb3b84e6e893e8ae7a29dd68ec296809a289784334a7a70a2f84f8acd7435c5eb1e4c9cee23e943dbe8b49c341')

prepare() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
	install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
}
