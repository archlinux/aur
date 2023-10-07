# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=bruno
pkgdesc="Opensource IDE For Exploring and Testing Api's"
pkgver=0.21.0
pkgrel=1
arch=('x86_64')
url="https://www.usebruno.com/"
license=('MIT')
makedepends=(
    'npm'
    'nvm'
)

source=(
   "${pkgname}-${pkgver}.tar.gz::https://github.com/usebruno/bruno/archive/v${pkgver}.tar.gz"
)

sha256sums=(
    '9ffefef45599811f1b7c449c886b6207f72d8a30e84248b1b4925f5c46121192'
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
}

build() {
    _ensure_local_nvm
    cd "$pkgname-$pkgver"

    # disabling husky however I can since I'm not in a git repository
    sed -i -e 's/"husky":.*//g' -e 's/"husky install"/"true"/g' package.json

    npm install --cache "${srcdir}/npm-cache"

    npm run build:graphql-docs
    npm run build:web
    npm run build:electron
}

package() {
    cd "$pkgname-$pkgver"

    install -D -m0644 license.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # TODO: copy build result where it belongs

    exit 1
}
