# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv6-bin
pkgver=6.0407
pkgrel=1
pkgdesc="Paid version of the FlexBV6 boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv/"
license=("custom")
makedepends=("patchelf")
depends=('glibc' 'zlib' 'fontconfig' 'freetype2' 'libc++' 'libgcc')
conflicts=("flexbv5-bin" "flexbv6-free-bin" "flexbv5-free-bin")

source=("flexbv-std-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv6/releases/flexbv-std-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('0026e95d2dd4f0ce66bf54d793e16301d04e8d860a58926008461e7a60f481727f8acdee9c2cde06535c098553362685d153fb955f695857367ce3baad76acde')
b2sums=('f5796da27f9370d395ebf61db62da188dade809ad47401c23076ac22656f5a2586ab0cab3e4fb4af022a3710cbbb69665ec62237a87d81ea4e62566e30d03021')

package() {
	cd "flexbv-std-${pkgver}-linux-x86_64"
	install -Dm755 "flexbv" "${pkgdir}/usr/bin/flexbv"
	patchelf --replace-needed "libunwind.so.1" "libgcc_s.so.1" "$pkgdir/usr/bin/flexbv"
	install -Dm755 "fbvpdf5" "${pkgdir}/usr/bin/fbvpdf5"
	install -Dm755 "libpdfium.so" "${pkgdir}/usr/lib/flexbv/libpdfium.so"
	patchelf --set-rpath "/usr/lib/flexbv" "$pkgdir/usr/bin/fbvpdf5"
	install -Dm644 "LICENCE.txt" "${pkgdir}/usr/share/licenses/flexbv/LICENCE.txt"

	cd "share"
	install -Dm644 "applications/flexbv.desktop" "${pkgdir}/usr/share/applications/flexbv.desktop"
	sed -i '/^Name=/ { /^Name\[/! s/^Name=.*/Name=FlexBV6/ }' "$pkgdir/usr/share/applications/flexbv.desktop"
	install -Dm644 "icons/hicolor/scalable/apps/flexbv.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/flexbv.svg"
	install -Dm644 "appdata/flexbv.appdata.xml" "${pkgdir}/usr/share/metainfo/flexbv.appdata.xml"
	install -Dm644 "mime/packages/flexbv.xml" "${pkgdir}/usr/share/mime/packages/flexbv.xml"
}
