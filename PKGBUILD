# Maintainer: Dj Isaac <aur at dejay dot dev>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=bruno-electron-bin
_pkgname=bruno
pkgdesc="Bruno, an opensource API Client for Exploring and Testing APIs using the system provided Electron"
pkgver=0.23.0
pkgrel=1
conflicts=('bruno' 'bruno-bin' 'bruno-git')
arch=('x86_64')
url="https://www.usebruno.com/"
license=('MIT')
_electron=electron25
depends=(
    "${_electron}"
)
makedepends=(
    'asar'
)

source=(
   "${_pkgname}-${pkgver}.tar.gz::https://github.com/usebruno/bruno/archive/v${pkgver}.tar.gz"
   com.usebruno.app.Bruno.desktop
)

sha256sums=(
    '19c75aeba21cf835375a748bd41891511e5786ec583453fa2402a8ecdbf16248'
    '7bad0d66e67fdaaf99d1b7b32ba2f119b7d6dba12ecfdb398c39ee3c81bbe051'
)

prepare() {
    cd "${_pkgname}-${pkgver}"

    # disabling husky however I can since I'm not in a git repository
    sed -i -e 's/"husky":.*//g' -e 's/"husky install"/"true"/g' package.json

    npm install --cache "${srcdir}/npm-cache"
}

build() {
    export NODE_ENV=production
    export NODE_OPTIONS=--openssl-legacy-provider

    cd "${_pkgname}-${pkgver}"

    npm run build:bruno-query
    npm run build:graphql-docs
    npm run build:web

    electronDist="/usr/lib/${_electron}"
    electronVer="$(cat ${electronDist}/version)"
    sed -i -e "s~\"dist\":.*~\"dist\": \"electron-builder --linux --x64 --dir --config electron-builder-config.js -c.electronDist=${electronDist} -c.electronVersion=${electronVer}\",~g" packages/bruno-electron/package.json

    npm run build:electron
}

package() {
    install -Dm0644 com.usebruno.app.Bruno.desktop -t "${pkgdir}/usr/share/applications/"

    cd "${_pkgname}-${pkgver}"

    install -Dm0755 /dev/null "${pkgdir}/usr/bin/${_pkgname}"
    cat >> "${pkgdir}/usr/bin/${_pkgname}" <<EOD
#! /usr/bin/sh
ELECTRON_IS_DEV=0 exec ${_electron} /usr/lib/bruno "\$@"
EOD

    install -Dm0644 license.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -d "${pkgdir}/usr/lib/${_pkgname}/"
    asar e packages/bruno-electron/out/linux-unpacked/resources/app.asar "${pkgdir}/usr/lib/${_pkgname}/"

    for i in 16 24 48 64 128 256 512 1024; do
        install -Dm644 "packages/bruno-electron/resources/icons/png/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/com.usebruno.app.Bruno.png"
    done
}
