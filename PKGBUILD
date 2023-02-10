# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=lowcharts-git
_pkgname="${pkgname%-git}"
pkgver=0.5.8.r92.94e3db4
pkgrel=3
pkgdesc="Tool to draw low-resolution graphs in terminal (git version)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'cargo')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

package() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo install --no-track --frozen --offline --all-features --root "${pkgdir}/usr/" --path .

	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
