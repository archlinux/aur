# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=dot-desktop-git
pkgdesc='Utility to read FreedDesktop .desktop files'
pkgver=1
pkgrel=1
url='https://github.com/kennylevinsen/dot-desktop'
arch=(x86_64)
provides=(dot-desktop)
conflicts=(dot-desktop)
depends=(glibc gcc-libs)
makedepends=(rust git)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

prepare () {
	cd "${pkgname}"
	mkdir -p "${srcdir}/cargo-home"
	HOME="${srcdir}/cargo-home" cargo fetch --locked
}

build () {
	cd "${pkgname}"
	HOME="${srcdir}/cargo-home" cargo build --release --locked --offline
}

check () {
	cd "${pkgname}"
	HOME="${srcdir}/cargo-home" cargo test --release --locked --offline
}

package () {
	HOME="${srcdir}/cargo-home" cargo install --locked --offline \
		--force --root "${pkgdir}/usr" --path "${srcdir}/${pkgname}"
	rm -f "${pkgdir}/usr/.crates.toml"
}
