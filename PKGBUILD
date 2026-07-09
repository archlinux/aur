# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ghreprimand
_pkgname=odytty
_appname=${_pkgname}
pkgname=${_pkgname}
pkgdesc="GPU-rendered Rust terminal emulator with an Odyssey visual identity"

pkgver=0.8.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('GPL-3.0-only')

makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc' 'bzip2' 'libxkbcommon' 'fontconfig' 'freetype2' 'vulkan-icd-loader' 'hicolor-icon-theme')

provides=("${_appname}")

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_pkgvername}.tar.gz")
sha256sums=('f3bba9260d5e2e2af41239f55f75905556cdcc8fbf1c93b77865bbd5bb90ef91')


prepare() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "dist/linux/io.unfinished_works.odytty.desktop" "${pkgdir}/usr/share/applications/io.unfinished_works.odytty.desktop"
	install -Dm644 "dist/linux/io.unfinished_works.odytty.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.unfinished_works.odytty.metainfo.xml"

	install -d "${pkgdir}/usr/share/icons"
	cp -a "dist/icons/hicolor" "${pkgdir}/usr/share/icons/"

	for doc in docs/*.md; do
		file="$(basename ${doc})"
		name="${file%.*}"
		ext="${file##*.}"
		new_name="${name^^}.${ext}"

		install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/${new_name}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
