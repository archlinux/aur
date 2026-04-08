pkgname=matlab-language-server-git
_pkgname='matlab-language-server'
pkgver=1.3.9.r2.g8389289
pkgrel=1
pkgdesc='Implementation of the Microsoft Language Server Protocol for the MATLAB language.'
arch=('any')
url="https://github.com/mathworks/${_pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('matlab-language-server')
conflicts=('matlab-language-server')
source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {

    cd "${srcdir}/${_pkgname}"

    git describe --long --tags --abbrev=7 | sed 's/^v//; s/-/.r/; s/-/./g'

}

prepare() {

    cd "${srcdir}/${_pkgname}"

    npm ci --cache "${srcdir}/.npm"

}

build() {

    cd "${srcdir}/${_pkgname}"

    npm run project-install --cache "${srcdir}/.npm"
    npm run compile --cache "${srcdir}/.npm"
    npm run package --cache "${srcdir}/.npm"

}

check() {

    cd "${srcdir}/${_pkgname}"

    npm run test --cache "${srcdir}/.npm"

}

package() {

    cd "${srcdir}/${_pkgname}"

    local npmdir="/usr/lib/node_modules/${_pkgname}"

    npm ci --omit=dev --cache "${srcdir}/.npm"

    sed -i '1 i\#!/usr/bin/env node' out/index.js
    chmod +x out/index.js

    install -d "${pkgdir}/usr/bin"
    ln -s "${npmdir}/out/index.js" "${pkgdir}/usr/bin/${_pkgname}"

    install -d "${pkgdir}/${npmdir}"
    cp -rt "${pkgdir}/${npmdir}" out matlab node_modules package.json

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -rt "${pkgdir}/usr/share/doc/${pkgname}" CONTRIBUTING.md README.md

    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

}
