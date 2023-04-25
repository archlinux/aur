# Maintainer: Jan Dvorak <(firstname).(lastname) @ dvorak-sw.com>
pkgname=epodpisfs
pkgver=14.0
pkgrel=1
epoch=
pkgdesc="Electronic signing of tax and other forms for the Financial Administration of the Czech Republic"
arch=('x86_64')
url="https://epodpora.mfcr.cz/cs/seznam-okruhu/podpisova-aplikace-epodpisfs/podpisova-aplikace-epodpisfs-4569"
license=('custom')
depends=('ca-certificates' 'ttf-dejavu' 'freetype2' 'glibc>=2.27' 'libxext' 'libxrender' 'libxtst' 'libx11' 'opensc' 'xdg-utils' 'zlib')
source=("${pkgname}-${pkgver}_${arch}.deb::https://adisspr.mfcr.cz/dpr/adis/idpr_pub/epodpis_info/epodpisfs-ubuntu-14.0.deb")
sha256sums=('a16505324e57b0d2c475c876e42d7206b850c84f90fbdde6638333e5b14297b5')
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
