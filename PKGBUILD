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
         '4cc5db920c614169192f5970544ef3f2'
         'e7b8a8425309723d600b75b6ba9e2c51'
         'b2fa0de39c0aeccb86a2ee880e49723b')

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
