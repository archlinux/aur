# Maintainer: David Cooper <david@dtcooper.com>

pkgname=tomato-radio-automation
_pkgname="${pkgname}"
pkgver=0.4.0
pkgrel=1
pkgdesc='Tomato Radio Automation desktop client. Dead simple radio ads.'
arch=('x86_64' 'aarch64')
url='https://dtcooper.github.io/tomato/'
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('nodejs' 'npm' 'git')
source=(
    "tomato-radio-automation-${pkgver}.tar.gz::https://github.com/dtcooper/tomato/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('bd49d00390a0579172b107eb4de076fbc5d890157aa37c8c717401a69700abd1')
_clientdir="tomato-${pkgver}/client"

# Source below the exact same as tomato-radio-automation-git
prepare() {
    cd "${_clientdir}"
    npm install
    cp "scripts/debian/tomato.desktop" "${srcdir}/${_pkgname}.desktop"
    sed "s/^\(Exec\|Icon\)=tomato/\1=${_pkgname}/" scripts/debian/tomato.desktop > "${srcdir}/${_pkgname}.desktop"
}

build() {
    cd "${_clientdir}"
    TOMATO_VERSION="${pkgver} (arch)" npm run package
    mv -v "out/Tomato-linux-"* "out/${_pkgname}"
    chmod 0755 "out/${_pkgname}"
}

package() {
    install -dm755 "${pkgdir}/opt/"
    cp -r "${srcdir}/${_clientdir}/out/${_pkgname}" "${pkgdir}/opt/"
    install -Dm755 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_clientdir}/assets/icons/tomato.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/tomato" "${pkgdir}/usr/bin/${_pkgname}"
}
