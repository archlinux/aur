# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=bruno-git
_pkgname=bruno
pkgdesc="Opensource API Client for Exploring and Testing APIs"
pkgver=2.2.0.r0.g526fcabff
pkgrel=1
arch=('x86_64')
url="https://www.usebruno.com/"
license=('MIT')
provides=('bruno')
conflicts=('bruno')
_electron=electron33
depends=(
    "${_electron}"
    'alsa-lib'
)
makedepends=(
    'nvm'
    'asar'
    'python-setuptools'
    'python'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(
    "$_pkgname::git+https://github.com/usebruno/bruno#branch=main"
    com.usebruno.app.Bruno.desktop
)

sha256sums=(
    'SKIP'
    '7bad0d66e67fdaaf99d1b7b32ba2f119b7d6dba12ecfdb398c39ee3c81bbe051'
)

_ensure_local_nvm() {
  # lets be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload

  export NVM_DIR="${srcdir}/${_pkgname}/.nvm"
  # The init script returns 3 if version
  #   specified in ./.nvrc is not (yet) installed in $NVM_DIR
  #   but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm
    cd "${_pkgname}"

    nvm install

    export HUSKY=0

    npm install --cache "${srcdir}/npm-cache" --include dev
    npm install node-addon-api --save-dev --cache "${srcdir}/npm-cache"
}

build() {
    _ensure_local_nvm
    export NODE_ENV=production
    export NODE_OPTIONS=--openssl-legacy-provider

    cd "${_pkgname}"

    npm run sandbox:bundle-libraries --workspace=packages/bruno-js

    npm run build --workspace=packages/bruno-common
    npm run build --workspace=packages/bruno-requests
    npm run build --workspace=packages/bruno-converters
    npm run build --workspace=packages/bruno-query
    npm run build --workspace=packages/bruno-graphql-docs

    npm run build --workspace=packages/bruno-app

    rm -rf packages/bruno-electron/{out,web}
    mkdir -p packages/bruno-electron/web
    cp -r packages/bruno-app/dist/* packages/bruno-electron/web

    sed -i -e 's@/static/@static/@g' packages/bruno-electron/web/**.html
    sed -i -e 's@/static/font@../../static/font@g' packages/bruno-electron/web/static/css/**.**.css

    find packages/bruno-electron/web -name '*.map' -type f -delete

    electronDist="/usr/lib/${_electron}"
    electronVer="$(cat ${electronDist}/version)"

    npm run pack --workspace=packages/bruno-electron -- \
        --linux \
        --x64 \
        --config electron-builder-config.js \
        -c.electronDist=${electronDist} \
        -c.electronVersion=${electronVer}
}

package() {
    install -Dm0644 com.usebruno.app.Bruno.desktop -t "${pkgdir}/usr/share/applications/"

    cd "${_pkgname}"

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
