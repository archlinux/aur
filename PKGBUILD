# Maintainer: Jan Dvorak <(firstname).(lastname) @ dvorak-sw.com>
pkgname=epodpisfs
pkgver=19.9
pkgrel=2
epoch=
pkgdesc="Electronic signing of tax and other forms for the Financial Administration of the Czech Republic"
arch=('x86_64')
url="https://podpora.mojedane.gov.cz/cs/seznam-okruhu/app/UXVlc3Rpb25zfGRpZ2VzdC5hc3B4P3NpZD00NTY4"
license=('custom')
depends=('ca-certificates' 'ttf-dejavu' 'freetype2' 'glibc>=2.27' 'libxext' 'libxrender' 'libxtst' 'libx11' 'opensc' 'xdg-utils' 'zlib')
options=('!strip' '!emptydirs' '!debug')
source=("${pkgname}-${pkgver}_${arch}.deb::https://adisspr.mfcr.cz/dpr/adis/idpr_pub/epodpis_info/epodpisfs-ubuntu-19.0.deb")
sha256sums=('dbe27a01277d8401ac6d21364db62d1dedc29f26a32c6cd364923094ca51429e')
                         
package() {      
        # Create subdirectories
        cd ${srcdir}
        install -d "${pkgdir}/usr/bin"

        # Extract package data
        tar --exclude='./epodpisfs' -xI unzstd -f data.tar.xz -C "${pkgdir}"
  
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
        chmod 755 "${pkgdir}/opt/${pkgname}/bootstrap"
}
