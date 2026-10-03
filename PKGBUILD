# Maintainer: Supernovatux <thulashitharan.d at gmail dot com>
pkgname=crab-on-desk-themes
_commit=782edefc7ebff70d462f326f1354451d1b86ffa3
pkgver=20261003
pkgrel=1
pkgdesc="Clawd, Calico and Cloudling themes for crab-on-desk, rendered locally from clawd-on-desk"
arch=('any')
url="https://github.com/rullerzhou-afk/clawd-on-desk"
license=('LicenseRef-clawd-on-desk-artwork')
depends=('crab-on-desk')
makedepends=('git' 'cargo' 'cmake' 'clang' 'electron')
options=('!lto')
source=("clawd-on-desk::git+${url}.git#commit=${_commit}"
        "crab-on-desk::git+https://github.com/Supernovatux/crab-on-desk.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
	cd crab-on-desk
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd crab-on-desk
	export RUSTUP_TOOLCHAIN=stable
	make CLAWD_ON_DESK="${srcdir}/clawd-on-desk" CARGO_FLAGS=--frozen themes
}

package() {
	cd crab-on-desk
	make PREFIX=/usr DESTDIR="${pkgdir}" CLAWD_ON_DESK="${srcdir}/clawd-on-desk" themes-install
	install -Dm644 "${srcdir}/clawd-on-desk/assets/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
