# Maintainer: Dj Isaac <aur at dejay dot dev>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=bruno-electron
_pkgname=bruno
pkgdesc="Bruno, an opensource API Client for Exploring and Testing APIs using the system provided Electron"
pkgver=1.38.1
pkgrel=1
conflicts=('bruno')
provides=('bruno')
arch=('x86_64')
url="https://www.usebruno.com/"
license=('MIT')
_electron=electron
depends=(
    "${_electron}>=31.2.0"
#    "nodejs>=20.9.0"
)

makedepends=(
    'asar'
    'nvm' # where did that bring you? back to me.
)

source=(
   "${_pkgname}-${pkgver}.tar.gz::https://github.com/usebruno/bruno/archive/v${pkgver}.tar.gz"
   com.usebruno.app.Bruno.desktop
)

sha256sums=('468ab677fdb381b20b1de3a3433c4b36c461f9bc85cd1326fdac8f6900f9e8dc'
            '7bad0d66e67fdaaf99d1b7b32ba2f119b7d6dba12ecfdb398c39ee3c81bbe051')

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm

    cd "${_pkgname}-${pkgver}"

    export HUSKY=0

    nvm install
    npm install --cache "${srcdir/npm-cache}"

    # WHY DO I HAVE TO INSTALL THIS MANUALLY?
    npm install node-addon-api --cache "${srcdir/npm-cache}"
}

build() {
    _ensure_local_nvm
    
    export NODE_ENV=production

    cd "${_pkgname}-${pkgver}"

    # build packages
    npm run build:graphql-docs
    npm run build:bruno-query
    npm run build:bruno-common

    # bundle js sandbox libraries
    npm run sandbox:bundle-libraries --workspace=packages/bruno-js

    # build app
    npm run build:web

    electronDist="/usr/lib/${_electron}"
    electronVer="$(cat ${electronDist}/version)"
    sed -i -e "s~\"dist:linux\":.*~\"dist:linux\": \"electron-builder --linux --x64 --dir --config electron-builder-config.js -c.electronDist=${electronDist} -c.electronVersion=${electronVer}\",~g" packages/bruno-electron/package.json
    
    npm run build:electron:linux
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
