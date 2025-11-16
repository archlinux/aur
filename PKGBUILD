# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-depiler"
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-git"
pkgver=0.0.5.1293
pkgrel=1
pkgdesc="A web extension that can improve the efficiency of PT sites, based on PT-Plugin-Plus and Manifest v3."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=("MIT")
makedepends=("git" "jq" "nodejs" "pnpm")
optdepends=('edge-stable' 'google-chrome')
source=("${_pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "%s.%s" "$(jq -r .version package.json)" "$(git rev-list --count HEAD)"
}

build() {
    cd "${_pkgname}"
    pnpm install
    pnpm build:dist
}

package() {
    cd "${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    cd dist-chrome
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
