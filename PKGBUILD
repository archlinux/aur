# Maintainer: Jan Dvorak <(firstname).(lastname) @ dvorak-sw.com>
pkgname=epodpisfs
pkgver=13.0
pkgrel=1
epoch=
pkgdesc="Electronic signing of tax and other forms for the Financial Administration of the Czech Republic"
arch=('x86_64')
url="https://epodpora.mfcr.cz/cs/seznam-okruhu/podpisova-aplikace-epodpisfs/podpisova-aplikace-epodpisfs-4569"
license=('custom')
depends=('ca-certificates' 'ttf-dejavu' 'freetype2' 'glibc>=2.27' 'libxext' 'libxrender' 'libxtst' 'libx11' 'xdg-utils' 'zlib')
source=("${pkgname}-${pkgver}_${arch}.deb::https://adisspr.mfcr.cz/dpr/adis/idpr_pub/epodpis_info/epodpisfs-ubuntu-13.0.deb")
sha256sums=('04615fabeb0e576dc1ac5b4955b94d7f715ab27df89c11b0acc6f952ea8fdae2')
package() {
	# Extract package data
        cd ${srcdir}
        tar xf data.tar.xz -C "${pkgdir}"

	# Fix desktop file
    	sed -i 's/^Categories=/Categories=Office;/' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	sed -i 's/^Name=ePodpisFS - podpisová aplikace Finanční správy/Name=ePodpisFS/' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	sed -i 's/^GenericName=ePodpisFS - podpisová aplikace Finanční správy/GenericName=Podpisová aplikace Finanční správy/' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	sed -i 's/^Comment=some comment/Comment=Podpisová aplikace Finanční správy/' "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    	# Symlink epodpisfs binary which is located in /opt
    	ln -sf "/opt/${pkgname}/bootstrap" "${pkgdir}/usr/bin/${pkgname}"

	# Install license file       
 	install -Dm 644 "${pkgdir}/opt/${pkgname}/jre/legal/java.base/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

 	# Fix permissions
	chown root:root -R "${pkgdir}"
    	chmod -R go-w "${pkgdir}"
}
