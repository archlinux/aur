# Maintainer: 3ED <krzysztofas at protonmail com>

pkgname=qsp-common
pkgver=20180830
pkgrel=1
epoch=
pkgdesc="Common files for packages qqsp and qsp-bin (mimetypes, icons)"
arch=("any")
url="https://github.com/QSPFoundation/qsp/"
license=('GPL' 'LGPL')
makedepends=("librsvg")
source=(
	"https://raw.githubusercontent.com/QSPFoundation/qsp/45c4e7180704b2940e547eb041bbc5b57c46d9e2/help/qsp-logo-vector.svg"
	"qsp.mime"
)
sha256sums=('12de4d6a91bdc09d334585b04dbb3d2e9ae7277f0274090b9f73c812d414e5dc'
            'SKIP')

prepare() {
	install -dm755 "$srcdir/hicolor/scalable/apps/"
	install -m644 "qsp-logo-vector.svg" "$srcdir/hicolor/scalable/apps/qsp.svg"

	for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512; do
		msg2 "Generating icon: $i raster from vector..."
		install -dm755 "$srcdir/hicolor/$i/apps/"
		rsvg-convert -w "${i%%x*}" -h "${i##*x}" -f png \
			-o "$srcdir/hicolor/$i/apps/qsp.png" "$srcdir/hicolor/scalable/apps/qsp.svg"
	done

}

package() {
	install -dm0755 "$pkgdir"/usr/share/{icons,mime/packages}/

	install -m0644 "$srcdir/qsp.mime" "$pkgdir/usr/share/mime/packages/qsp.xml"
  
	bsdtar -cf - "hicolor" | bsdtar -xf - -C "$pkgdir/usr/share/icons"
}
