pkgname=matlab-language-server-git
_pkgname='matlab-language-server'
pkgver=85.0e2ce5f
pkgrel=1
pkgdesc='Implementation of the Microsoft Language Server Protocol for the MATLAB language.'
arch=('any')
url="https://github.com/mathworks/${_pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {

    cd "${srcdir}/${_pkgname}"

    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

build() {

    cd "${srcdir}/${_pkgname}"

    npm ci --cache "${srcdir}/npm-cache"

}

package() {

    cd "${srcdir}/${_pkgname}"

    npm run package --cache "${srcdir}/npm-cache"

    local npmdir="/usr/lib/node_modules/${_pkgname}"

    install -d "${pkgdir}/${npmdir}"

    sed -i '1 i\#!/usr/bin/env node' out/index.js
    chmod +x out/index.js

    cp -rt "${pkgdir}/${npmdir}" out matlab

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -rt "${pkgdir}/usr/share/doc/${pkgname}" CONTRIBUTING.md README.md

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    install -d "${pkgdir}/usr/bin"
    ln -s "${npmdir}/out/index.js" "${pkgdir}/usr/bin/${_pkgname}"

}
