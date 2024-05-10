# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-Plugin-Plus"
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-git"
pkgver=1.6.1.2650
pkgrel=1
pkgdesc="Microsoft Edge, Google Chrome, Firefox browser plugin (Web Extensions), which is mainly used to assist the seeds of downloading PT station."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${_pkgname}-dev")
license=("MIT")
makedepends=("git" "jq" "yarn")
optdepends=('google-chrome' 'microsoft-edge-stable-bin')
source=("${_pkgname}::git+${url}.git#branch=dev")
sha256sums=('SKIP')
options=(!strip !debug)

## prepare function run before pkgver function, and build funtion run after pkgver function.
## manifest.json are generated after "yarn build".
prepare() {
    cd "${_pkgname}"
    yarn
    yarn build
}

pkgver() {
    local _pkgver=$(jq -r .version "${_pkgname}/dist/manifest.json")
    if [[ -n $_pkgver && $_pkgver != null ]]; then
        echo "$_pkgver"
    else
        exit 1
    fi
}

package() {
    cd "${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}-dev/LICENSE"

    cd "dist"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}-dev/"{} \;
}
