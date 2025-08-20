# Maintainer: David Cooper <david@dtcooper.com>

pkgname=tomato-radio-automation
_pkgname="${pkgname}"
pkgver=0.13.0
pkgrel=1
pkgdesc='Tomato Radio Automation desktop client. Dead simple radio ads.'
arch=('x86_64' 'aarch64')
url='https://dtcooper.github.io/tomato/'
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('nodejs' 'npm' 'git' 'jq')
options=('!debug')
source=(
    "tomato-radio-automation-${pkgver}.tar.gz::https://github.com/dtcooper/tomato/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('8b5fb09437cbdf28ea14f58f60f13567489fb890d21ff9475a2515c087defa21')
_repodir="tomato-${pkgver}"

_shortver() {
    echo "${pkgver}"
}

_longver() {
    echo "${pkgver}"
}

# Source below the exact same as tomato-radio-automation-git
prepare() {
    cd "${_repodir}/client"
    npm install
    cp "scripts/debian/tomato.desktop" "${srcdir}/${_pkgname}.desktop"
    sed "s/^\(\(Exec\|Icon\)=.*\)tomato/\1${_pkgname}/" scripts/debian/tomato.desktop > "${srcdir}/${_pkgname}.desktop"
}

build() {
    cd "${_repodir}/client"
    jq '.version = "'"$(_shortver)"'"' package.json > package.json.tmp
    mv -v package.json.tmp package.json
    TOMATO_VERSION="$(_longver) (arch)" npm run package
    mv -v "out/Tomato-linux-"* "out/${_pkgname}"
    chmod 0755 "out/${_pkgname}"
}

package() {
    install -dm755 "${pkgdir}/opt/"
    cp -r "${srcdir}/${_repodir}/client/out/${_pkgname}" "${pkgdir}/opt/"
    install -Dm755 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_repodir}/client/assets/icons/tomato.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/${_repodir}/LICENSE" "${pkgdir}/usr/share/licenses/tomato-radio-automation/LICENSE"
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/tomato" "${pkgdir}/usr/bin/${_pkgname}"
}
