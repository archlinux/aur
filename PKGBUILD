# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=shell-mcp
pkgver=0.1.1
pkgrel=1
pkgdesc="Scoped, allowlisted shell access over the Model Context Protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/devrelopers/shell-mcp"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')

source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
b2sums=('6287e6ef729bb5951c96f6a30755cb09e462380c2b9f4afaa80d18ea2ae852a95efd8774f908cf733b397f350017fc4f19f45bc75f89548ac97fd66a1f13a0f3')

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --frozen --release --target-dir target
}

check() {
	cd "${pkgname}-${pkgver}"

	cargo test --frozen --release --target-dir target
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/shell-mcp \
		"${pkgdir}/usr/bin/shell-mcp"
}
