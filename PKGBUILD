# Maintainer: kkren <i@kkren.me>
# Modified from poi's PKGBUILD
# Contributor: Jianfeng Zhang <swordfeng123@gmail.com>
_pkgname=poi
_electron=electron20
pkgname=${_pkgname}_arch_electron
pkgver=10.9.2.0.g69d7ab10
pkgrel=1
pkgdesc="Scalable KanColle browser and tool, using the system provided electron"
arch=('any')
url="https://github.com/poooi/poi/"
license=('MIT')
depends=("${_electron}" 'nodejs' 'nss' 'libxss' 'gtk3')
makedepends=('git' 'nodejs' 'imagemagick' 'zlib' 'unzip' 'gulp' 'npm' 'python2' 'jq')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/poooi/poi.git"
        "${_pkgname}.desktop"
        "${_pkgname}.sh")
sha256sums=('SKIP'
            '24f89c538a189a5db96be3e3228aba6e4e7d332c5a368b15dacb6e97ee6f7586'
            'e03f2205284dc6dfcfd344b4d586f2e9b50e3da6ffb2f786bdfba27101cea5e9')
options=('!strip') # nothing to strip


prepare() {
    sed -i "s|@PKGNAME@|${_pkgname}|;s|@ELECTRON@|${_electron}|" poi.sh
    cd ${srcdir}/${_pkgname}
    git checkout -f $(git tag --sort=-taggerdate | egrep -v '.*(alpha|beta).*' | head -n 1)
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    git clean -xdf
    npm install
    gulp build
}

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/${_pkgname}/app_compiled" "${pkgdir}/usr/share/poi"
    # workaround for strange behavior of babel
    mkdir -p "${pkgdir}/usr/share/poi/node_modules/.cache/@babel/register"

    cd "${srcdir}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    for s in 16 24 32 48 64 96 128 512; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps"
        convert "${_pkgname}/assets/icons/poi.png" -resize ${s}x${s} "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/${_pkgname}.png"
    done

    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
    ln -s "../../${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm 755 "${srcdir}/poi.sh" "${pkgdir}/usr/bin/${_pkgname}"
    chmod 0755 "${pkgdir}/usr/bin/${_pkgname}"

    find "${pkgdir}" -type f -name .DS_Store -delete
}
