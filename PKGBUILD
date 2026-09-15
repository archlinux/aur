# Maintainer: Aria Vesta <dev@ariavesta.com>
_pkgname=bot-crossing
pkgname=${_pkgname}-git
pkgver=r10.a497242
pkgrel=1
pkgdesc="3D colony sim where every coding-agent thread on your machine is an astronaut building something"
arch=('any')
url="https://botcrossing.com"
license=('MIT')
depends=('nodejs>=22.13')
makedepends=('git' 'npm')
optdepends=('xdg-utils: open threads and folders, and launch the browser from the desktop entry')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "${pkgname}::git+https://github.com/Station-Sciences/bot-crossing.git#branch=main"
    "${_pkgname}"
    "${_pkgname}.service"
    "${_pkgname}.desktop"
)
md5sums=('SKIP'
         '95efe63dac9efb2d84fa959d02aecc7f'
         'f431abc074b85ea8736ed120ba32d608'
         'd16997ebff2289e703d2177a6bf677d8')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${pkgname}"
    npm ci --cache "${srcdir}/npm-cache"
    npm run build
}

check() {
    cd "${pkgname}"
    npm test
}

package() {
    cd "${pkgname}"

    install -d "${pkgdir}/usr/lib/${_pkgname}"
    cp -r dist server "${pkgdir}/usr/lib/${_pkgname}/"

    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
