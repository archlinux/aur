# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=bruno
pkgdesc="Opensource API Client for Exploring and Testing APIs"
pkgver=1.2.0
pkgrel=1
arch=('x86_64')
url="https://www.usebruno.com/"
license=('MIT')
_electron=electron21
depends=(
    "${_electron}"
    'alsa-lib'
)
makedepends=(
    'nvm'
    'asar'
)

source=(
   "${pkgname}-${pkgver}.tar.gz::https://github.com/usebruno/bruno/archive/v${pkgver}.tar.gz"
   com.usebruno.app.Bruno.desktop
)

sha256sums=(
    'aaa3280870c00770f38229f70e3bb6d6e6a3f79902cb5c543019db6c6541d97b'
    '7bad0d66e67fdaaf99d1b7b32ba2f119b7d6dba12ecfdb398c39ee3c81bbe051'
)

_ensure_local_nvm() {
  # lets be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload

  export NVM_DIR="${srcdir}/${pkgname}-${pkgver}/.nvm"
  # The init script returns 3 if version
  #   specified in ./.nvrc is not (yet) installed in $NVM_DIR
  #   but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm
    cd "${pkgname}-${pkgver}"

    nvm install

    # disabling husky however I can since I'm not in a git repository
    sed -i -e 's/"husky":.*//g' -e 's/"husky install"/"true"/g' package.json

    npm install --cache "${srcdir}/npm-cache"
}

build() {
    _ensure_local_nvm
    export NODE_ENV=production
    export NODE_OPTIONS=--openssl-legacy-provider

    cd "${pkgname}-${pkgver}"

    npm run build:bruno-query
    npm run build:graphql-docs
    npm run build:web

    electronDist="/usr/lib/${_electron}"
    electronVer="$(cat ${electronDist}/version)"
    sed -i -e "s~\"dist:linux\":.*~\"dist:linux\": \"electron-builder --linux --x64 --dir --config electron-builder-config.js -c.electronDist=${electronDist} -c.electronVersion=${electronVer}\",~g" packages/bruno-electron/package.json

    npm run build:electron:linux
}

package() {
    install -Dm0644 com.usebruno.app.Bruno.desktop -t "${pkgdir}/usr/share/applications/"

    cd "${pkgname}-${pkgver}"

    install -Dm0755 /dev/null "${pkgdir}/usr/bin/${pkgname}"
    cat >> "${pkgdir}/usr/bin/${pkgname}" <<EOD
#! /usr/bin/sh
ELECTRON_IS_DEV=0 exec ${_electron} /usr/lib/bruno "\$@"
EOD

    install -Dm0644 license.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/lib/${pkgname}/"
    asar e packages/bruno-electron/out/linux-unpacked/resources/app.asar "${pkgdir}/usr/lib/${pkgname}/"

    for i in 16 24 48 64 128 256 512 1024; do
        install -Dm644 "packages/bruno-electron/resources/icons/png/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/com.usebruno.app.Bruno.png"
    done
}
