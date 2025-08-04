# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-depiler"
pkgname="${_reponame,,}"
pkgver=0.0.4
pkgrel=4
pkgdesc="A web extension that can improve the efficiency of PT sites, based on PT-Plugin-Plus and Manifest v3."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${pkgname}")
conflicts=("${pkgname}")
license=("MIT")
makedepends=("git" "jq" "pnpm")
optdepends=('edge-stable' 'google-chrome')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('15b93b1878778fe9b4b1bb552781780007e83b4d02f15ded346717cb1b9bd93f')

build() {
    cd "${pkgname}"
    local _manifest_ver="${pkgver}.$(git rev-list --count "${pkgver}")"
    local _commit=$(git rev-parse --short "${pkgver}")
    pnpm install
    pnpm build:dist
    cd dist-chrome
    jq \
        --arg version "${_manifest_ver}" \
        --arg version_name "${_manifest_ver}+${_commit}" \
        '.version = $version | .version_name = $version_name' \
        manifest.json > manifest.json.new
    mv manifest.json.new manifest.json
}

package() {
    cd "${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd dist-chrome
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
