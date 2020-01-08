# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=dot-desktop-git
pkgdesc='Utility to read FreedDesktop .desktop files'
pkgver=r12.ba8cd73
pkgrel=1
url='https://github.com/kennylevinsen/dot-desktop'
arch=(x86_64)
license=(GPL3)
provides=(dot-desktop)
conflicts=(dot-desktop)
depends=(glibc gcc-libs)
makedepends=(rust git)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

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
