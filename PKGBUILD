# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=freecut
pkgname="${_pkgname}-git"
pkgver=r2222.a3ecfcef
pkgrel=1
pkgdesc="Professional-grade video editor that runs entirely in your browser"
arch=("any")
url="http://freecut.net"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=("git" "npm")
optdepends=("caddy: for serving ${_pkgname} HTML files"
            "nginx: for serving ${_pkgname} HTML files"
            "traefik: for serving ${_pkgname} HTML files")
source=("${_pkgname}::git+https://github.com/walterlow/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    npm install
    npm run build
    rm dist/.gitkeep

    ## Comment out the next line to keep the .map files for debugging.
    find dist -type f -name "*.map" -delete
}

package() {
    cd "${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    cd dist
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/${_pkgname}/{}" \;
}
