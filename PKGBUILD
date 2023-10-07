# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=bruno
pkgdesc="Opensource IDE For Exploring and Testing Api's"
pkgver=0.21.1
pkgrel=1
arch=('x86_64')
url="https://www.usebruno.com/"
license=('MIT')
_electron=electron21
depends=(
    "$_electron"
)
makedepends=(
    'nvm'
    'asar'
)

source=(
   "${pkgname}-${pkgver}.tar.gz::https://github.com/usebruno/bruno/archive/v${pkgver}.tar.gz"
)

sha256sums=(
    '8406b7d1c62d234c92a0653587b5c6097f4defe9b605011c6bd99edd5a45a8e5'
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
    cd "$pkgname-$pkgver"

    nvm install

    # disabling husky however I can since I'm not in a git repository
    sed -i -e 's/"husky":.*//g' -e 's/"husky install"/"true"/g' package.json

    npm install --cache "${srcdir}/npm-cache"
}

build() {
    _ensure_local_nvm
    export NODE_ENV=production

    cd "$pkgname-$pkgver"

    npm run build:bruno-query
    npm run build:graphql-docs
    npm run build:web

    electronDist="/usr/lib/${_electron}"
    electronVer="$(cat ${electronDist}/version)"
    sed -i -e "s~\"dist\":.*~\"dist\": \"electron-builder --linux --x64 --dir --config electron-builder-config.js -c.electronDist=$electronDist -c.electronVersion=$electronVer\",~g" packages/bruno-electron/package.json

    npm run build:electron
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 /dev/null "$pkgdir/usr/bin/$pkgname"
    cat >>"$pkgdir/usr/bin/$pkgname" <<EOD
#! /usr/bin/sh
exec $_electron /usr/lib/bruno "\$@"
EOD

    install -Dm0644 license.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d "$pkgdir/usr/lib/$pkgname/"
    asar e "packages/bruno-electron/out/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
}
