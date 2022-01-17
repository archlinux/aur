# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Christopher A. Williamson
# Contributor: Moritz Poldrack <moritz at poldrack dot dev>
# Contributor: Pascal Mathis <mail@pascalmathis.com>
pkgname=rambox-pro-bin
_pkgname=ramboxpro
pkgver=1.5.3
pkgrel=1
pkgdesc='Workspace browser to manage many web applications in one place'
arch=('x86_64')
url='https://rambox.app/'
license=('custom')
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss' 'python')
provides=('ramboxpro')
options=('!emptydirs')
conflicts=('rambox-pro-bin-beta')

# To extract the EULA as a file:
# 1. Go to https://rambox.app/eula in a Javascript-enabled browser.
# 2. Save the rendered result to an HTML file.
# 3. Run the shell command line:
#    html2text --body-width=80 file.html | awk '/^# .*EULA/,/footer_logo/ { print }' | head -n -1
source=("${_pkgname}-EULA"
        "${_pkgname}-${pkgver}.deb::https://github.com/ramboxapp/download/releases/download/v${pkgver}/RamboxPro-${pkgver}-linux-x64.deb")

sha256sums=('220a1fe2afa6485bfc15dde23dd081804a29f94a86ce74164082aa8b2266e662'
            'b390263e0f88264439e779d511bdec06b3acf787a0807e30f00d95dde38d29d7')

build() {
    rm -rf "${srcdir}/root"
    mkdir -p "${srcdir}/root"
    bsdtar -xf 'data.tar.xz' -C "${srcdir}/root"
}

package() {
    install -d -m 0755 \
        "${pkgdir}/opt/${_pkgname}" \
        "${pkgdir}/usr/bin" \
        "${pkgdir}/usr/share/applications" \
        "${pkgdir}/usr/share/icons" \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -rp "${srcdir}/root/opt/RamboxPro/." "${pkgdir}/opt/${_pkgname}/."
    cp -rp "${srcdir}/root/usr/share/icons/." "${pkgdir}/usr/share/icons/."

    install -m 0644 "${srcdir}/${_pkgname}-EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
    install -m 0644 "${srcdir}/root/usr/share/applications/ramboxpro.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    ln -s "/opt/${_pkgname}/ramboxpro" "${pkgdir}/usr/bin/${_pkgname}"
    sed -i "s~/opt/RamboxPro/~/opt/${_pkgname}/~g" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
