# Maintainer: Ismet Togay <ismet.togay[at]gmail[dot]com>
# Contributor: Osman Karagoz <osmank3[at]gmail[dot]com>
# Contributor: oltulu <cihanalk[at]gmail[dot]com>

pkgname=uyap
pkgver=5.4.16
pkgrel=2
_dlurl="https://rayp.adalet.gov.tr/resimler/2/dosya/uyap-pardus-5-4-16-amd6429-12-20252-41-pm.zip"
pkgdesc="Document editors for the Turkish National Judiciary Informatics System (UYAP)"
arch=("any")
url="https://uyap.gov.tr/UYAP-Editor"
license=("custom")
depends=("pcsclite" "java-runtime=11")
optdepends=("akia: sign UYAP documents"
            "cups: print documents"
            "zenity: display graphical error messages"
            "kdialog: display graphical error messages in KDE")
source=("${_dlurl}"
        "uyap-launcher.sh"
        "uyap-dokuman.desktop"
        "uyap-sablon.desktop")
sha256sums=('2e3643111cce9d0d0c71e8300ef85d02f7591b96b43f9aabdb98564aa6bcd0a8'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    # Dynamically locate the main setup .deb file regardless of future internal zip structures
    local deb_file=$(find "${srcdir}" -type f -name "uyapeditor_${pkgver}_*.deb" | head -n 1)
    
    # Extract the nested data archive out of the deb package
    bsdtar -xf "${deb_file}" data.tar.xz
    bsdtar -xf data.tar.xz -C "${srcdir}"
}

package() {
    # Move extracted opt/usr to pkgdir
    mv "${srcdir}/usr" "${pkgdir}/usr"

    # Install custom wrappers
    install -Dm755 "${srcdir}/uyap-launcher.sh" "${pkgdir}/usr/bin/uyapeditor"
    ln -s uyapeditor "${pkgdir}/usr/bin/uyapsablon"

    # Install FreeDesktop-compliant desktop files natively
    install -Dm644 "${srcdir}/uyap-dokuman.desktop" "${pkgdir}/usr/share/applications/uyap-dokuman.desktop"
    install -Dm644 "${srcdir}/uyap-sablon.desktop" "${pkgdir}/usr/share/applications/uyap-sablon.desktop"

    # Cleanup official wrappers and redundant desktop files from the internal package
    rm -f "${pkgdir}/usr/share/UYAPEditor/dokuman.sh"
    rm -f "${pkgdir}/usr/share/UYAPEditor/sablon.sh"
    rm -f "${pkgdir}/usr/share/applications/dokuman.desktop"
    rm -f "${pkgdir}/usr/share/applications/sablon.desktop"
}
