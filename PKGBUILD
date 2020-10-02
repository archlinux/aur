# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
# Contributor: Christopher A. Williamson
# Contributor: Pascal Mathis <mail@pascalmathis.com>
pkgname=rambox-pro-bin-beta
_pkgname=ramboxpro
pkgver=1.4.0.release
_pkgver=1.4.0
pkgrel=1
pkgdesc='Workspace browser to manage many web applications in one place (BETA)'
arch=('x86_64')
url='https://rambox.pro/'
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss' 'python')
provides=('ramboxpro')
options=('!emptydirs')
conflicts=('rambox-pro-bin')
# EULA file: 'html2text --body-width=80 https://rambox.pro/includes/eula.html'
source=("${_pkgname}-EULA"
        "${_pkgname}-${pkgver}.deb::https://github.com/ramboxapp/download/releases/download/v${_pkgver}/RamboxPro-${_pkgver}-linux-x64.deb")
md5sums=('e9bf9670347cd34d44661871bf34f043'
         'cf1f6f44474be4608f8bd50e60ab2b47')

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
