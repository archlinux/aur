# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=rlr

pkgname=${_pkgname}
pkgver=0.3.2
pkgrel=1
pkgdesc='Interactive pixel screen ruler and protractor'

arch=('x86_64' 'aarch64')
url='https://nessuent.xyz/bb.html'
license=('GPL-3.0')

provides=("${_pkgname}")

makedepends=('rust')
depends=('glibc' 'gcc-libs' 'glib2' 'gtk3' 'gdk-pixbuf2' 'cairo')

install=rlr.install

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/epilys/${_pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('9b1376bfade63875eb950130460dfc278f3dfd381d61d92ca0ae5ad7cd9a98d806e59e1fc04b5cc5516b539245565053fb294dbea5abf61eafbb7b605f9e96bf')

prepare() {
	cd "${_pkgname}-${pkgver}/"

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_pkgname}-${pkgver}/"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cargo build --frozen --release --all-features
}

check() {
	cd "${_pkgname}-${pkgver}/"

	cargo test --release
}

package() {
	cd "${_pkgname}-${pkgver}/"

	install -Dm 755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"

	install -Dm 644 "data/com.github.epilys.rlr.desktop" -t "${pkgdir}/usr/share/applications/"

	install -Dm 644 "data/com.github.epilys.rlr.Settings.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"

	install -Dm 644 "data/com.github.epilys.rlr.png" -t "${pkgdir}/usr/share/icons/hicolor/112x112/apps/"
	install -Dm 644 "data/com.github.epilys.rlr.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	install -Dm 644 "data/com.github.epilys.rlr-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/"

	install -Dm 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm 644 "data/resources.xml" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
