# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=graft
pkgver=0.9.1
pkgrel=1
pkgdesc="Open-source context layer for large codebases — turbocharge Claude Code, Cursor, Codex, Gemini & every coding agent"
arch=('x86_64')
url="https://github.com/NanoNets/Graft"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@nanonets/graft/-/graft-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('f9861459ee8de6cab1735c7e61f8ef67568fd1e448366e9f69b99325572546ae')

latestver() {
    curl -fsSL 'https://registry.npmjs.org/@nanonets/graft/latest' | jq -r '.version'
}

build() {
    npm install --cache "${srcdir}/npm-cache" \
        --prefix="${srcdir}/staging" \
        --global \
        "${srcdir}/${pkgname}-${pkgver}.tgz"
}

package() {
    local node_root="${pkgdir}/usr/lib/node_modules/@nanonets/graft"

    install -dm755 "${pkgdir}/usr/lib/node_modules/@nanonets"
    cp -a "${srcdir}/staging/lib/node_modules/@nanonets/graft" "${node_root}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/node_modules/@nanonets/graft/dist/cli.js" "${pkgdir}/usr/bin/graft"

    # Clean npm metadata referencing $srcdir/$pkgdir
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i "/_where/d"

    install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
