# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=rlr-git
pkgver=r30.bff17e8
pkgrel=1
pkgdesc="interactive pixel screen ruler and protractor"
arch=('any')
url="https://github.com/epilys/rlr"
license=('GPL')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	# binary
	install -Dm0755 "${srcdir}/${pkgname%-git}/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin/"
	# desktop file
	install -Dm644 "${srcdir}/${pkgname%-git}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"

	# icon
	install -Dm644 "${srcdir}/${pkgname%-git}/${pkgname%-git}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
	# symbolic icon
	install -Dm644 "${srcdir}/${pkgname%-git}/${pkgname%-git}.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${pkgname%-git}.svg"

}
