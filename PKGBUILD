# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=picoforge
pkgver=0.9.0
pkgrel=1
pkgdesc="Desktop tool for configuring and managing Pico FIDO security keys"
arch=('x86_64')
url="https://github.com/librekeys/picoforge"
license=('AGPL-3.0-only')
depends=('pcsclite' 'ccid' 'libxcb' 'libxkbcommon' 'systemd-libs')
makedepends=('cargo' 'xcb-util-keysyms')

_tag=v${pkgver}

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
b2sums=('b9d2a4df9db5c8be1232486e6c329a40d639320ea5d0610425ec6e11f3f1f3820782000483d6b72f94ebec7c0edd50d6ee152c80cf1623a8ef8e93f331622b58')

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
	cd "${pkgname}-${pkgver}"

	# Keep LTO enabled while making C/C++ static objects linkable.
	export CFLAGS+=" -ffat-lto-objects"
	export CXXFLAGS+=" -ffat-lto-objects"

	cargo build --frozen --release --target-dir target
}

check() {
	cd "${pkgname}-${pkgver}"

	cargo test --frozen --release --target-dir target
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/picoforge \
		"${pkgdir}/usr/bin/picoforge"

	install -Dm644 data/in.suyogtandel.picoforge.desktop \
		"${pkgdir}/usr/share/applications/in.suyogtandel.picoforge.desktop"

	install -Dm644 static/appIcons/in.suyogtandel.picoforge.svg \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/in.suyogtandel.picoforge.svg"

	install -Dm644 static/appIcons/in.suyogtandel.picoforge-symbolic.svg \
		"${pkgdir}/usr/share/icons/hicolor/symbolic/apps/in.suyogtandel.picoforge-symbolic.svg"

	install -Dm644 data/in.suyogtandel.picoforge.metainfo.xml \
		"${pkgdir}/usr/share/metainfo/in.suyogtandel.picoforge.metainfo.xml"
}
