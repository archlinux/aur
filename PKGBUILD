# Maintainer: 3ED <krzysztofas at protonmail com>

pkgname=qqsp
_pkgname=Qqsp
_name="QT Quest Soft Player"
_desc="a interactive fiction stories and games player"
pkgver=1.7
pkgrel=1
epoch=
pkgdesc="$_name is $_desc (compatible fork of qsp.su)"
arch=("x86" "x86_64")
url="https://gitlab.com/Sonnix1/Qqsp"
license=('MIT')
depends=("qt5-webengine" "qt5-multimedia")
makedepends=("gendesk" "librsvg")
source=(
	"${_pkgname}::git+https://gitlab.com/Sonnix1/Qqsp.git#tag=v$pkgver"
)
sha256sums=('SKIP')

prepare() {
	cd "${_pkgname}"

	msg2 "Copying SVG icon..."
	install -dm755 "$srcdir/hicolor/scalable/apps/"
	install -m644 "icons/qsp-logo-vector.svg" "$srcdir/hicolor/scalable/apps/Qqsp.svg"

	for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
		msg2 "Generating $i icon..."
		install -dm755 "$srcdir/hicolor/$i/apps/"
		rsvg-convert -w "${i%%x*}" -h "${i##*x}" -f png \
			-o "$srcdir/hicolor/$i/apps/Qqsp.png" "$srcdir/hicolor/scalable/apps/Qqsp.svg"
	done

	msg2 "Creating desktop file..."
	gendesk -n -f \
		--pkgname=Qqsp \
		--pkgdesc="$_desc" \
		--name="$_name" \
		--exec="/usr/bin/Qqsp" \
		--terminal=false \
		--categories=Game \
		"$startdir/PKGBUILD"
}

build() {
	cd "${_pkgname}"
	qmake \
		PREFIX=/usr # ???

	make
}

package() {
	install -dm0755 "$pkgdir"/usr/{bin,share/{applications,icons,licenses/qqsp}}/

	install -m0755 "$_pkgname/Qqsp" "$pkgdir/usr/bin/"
	install -m0644 "$_pkgname/Qqsp.desktop" "$pkgdir/usr/share/applications/"
	install -m0644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/qqsp/"

	bsdtar -cf - "hicolor" | bsdtar -xf - -C "$pkgdir/usr/share/icons"
}
