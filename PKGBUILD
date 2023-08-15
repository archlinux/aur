# Maintainer: ChuJian <2474681296 at qq dot com>
# Contributor: jingutech
# Contributor: Bruce Zhang
pkgname=listen1-desktop
pkgver=2.31.0
_electron=electron13
pkgrel=1
pkgdesc="One for all free music in China (Build from source)"
arch=('any')
url="https://github.com/listen1/listen1_desktop"
license=('MIT')
depends=("${_electron}")
makedepends=('npm' 'jq' 'moreutils')
provides=('listen1')
conflicts=('listen1')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/listen1/listen1_desktop/archive/v$pkgver.tar.gz"
	"chrome_extension-${pkgver}.tar.gz::https://github.com/listen1/listen1_chrome_extension/archive/refs/tags/v${pkgver}.tar.gz"
	"listen1.sh"
	"listen1.desktop"
)
sha256sums=('d3dec4c4818b07430ca742c463183a926f25bb47b3f9f1236ddcc64ebdce0b64'
            '834f8626a8f4e61f2b40d8cdc451a07870db0fc5ae64c9bc4d26cbf8b6b0deb5'
            '6e13f2757600659fe5d48ba88bc24ae632049c2f4c3f1a8c95eac75fba4e38d2'
            '4fb54621e98ddd1cfe8d10619d193256fd0702b58ab01736aec512765f43d9df')

prepare() {
	cd "${pkgname/-/_}-$pkgver"

	local electronDist="/usr/lib/${_electron}"
	local electronVersion="$(< $electronDist/version)"
	jq ".devDependencies.electron = \"$electronVersion\"" package.json | sponge package.json
	jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
	jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json

	cp -rf "$srcdir/listen1_chrome_extension-$pkgver"/* app/listen1_chrome_extension

	sed -i "s|__ELECTRON__|${_electron}|g" ${srcdir}/listen1.sh
	sed -i "s|__PKGVER__|${pkgver}|g" ${srcdir}/listen1.desktop
}

build() {
	cd "${pkgname/-/_}-$pkgver"
	export HOME=${srcdir}
	npm install
	npm run dist:linux64 -- --dir
}

package() {
	cd "${pkgname/-/_}-$pkgver/dist/linux-unpacked"

	# Install asar file
	install -Dm644 resources/app.asar "$pkgdir/usr/share/listen1/app.asar"

	# Install start script
	install -Dm755 "$srcdir/listen1.sh" "$pkgdir/usr/bin/listen1"

	# Install desktop file
	install -Dm644 "$srcdir/listen1.desktop" "$pkgdir/usr/share/applications/listen1.desktop"

	# Install icons
	cd "$srcdir/${pkgname/-/_}-$pkgver/app/resources"
	install -Dm644 logo_16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/listen1.png"
	install -Dm644 logo_32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/listen1.png"
	install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/listen1.png"
	install -Dm644 logo512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/listen1.png"
}
