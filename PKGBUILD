# Maintainer: Dan Walsh <dan@danwalsh.ca>
pkgname=redisinsight
pkgver=3.0.0
pkgrel=1
pkgdesc="Desktop manager that provides an intuitive and efficient GUI for Redis, allowing you to interact with your databases, monitor, and manage your data."
arch=('x86_64')
url='https://github.com/redis/RedisInsight'
license=('custom:SSPL')
depends=()
provides=(redis-insight)
conflicts=(redis-insight-bin)
makedepends=(
gendesk
nodejs
yarn
npm
nvm
jq
make
python-setuptools
clang
git
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/RedisInsight/RedisInsight/archive/$pkgver.tar.gz")
sha256sums=('96f4adf6fd27cf16d94c1c4e3a5abf608b14768d768287cd45f9b1dcc1a83f79')

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
  cd RedisInsight-$pkgver

  # unable to build some plugins for some reason, disable them here
  sed -i -E '/^# Build ri-explain plugin/,$d' scripts/build-statics.sh
  
  # bypass confirmation prompt for npx
  sed -i -E 's/"postinstall": "npx patch-package"/"postinstall": "npx --yes patch-package"/' redisinsight/package.json
  sed -i -E 's/"postinstall": "npx patch-package"/"postinstall": "npx --yes patch-package"/' redisinsight/api/package.json

  _ensure_local_nvm
  nvm install 24.4.1
}

build() {
  cd RedisInsight-$pkgver
  _ensure_local_nvm

  mkdir -p electron
  VERSION=$(jq -r ".version" redisinsight/package.json)
  cp ./redisinsight/package.json ./electron/package.json
  echo "$VERSION" > electron/version

  yarn --cwd redisinsight/api/ install --ignore-optional
  yarn --cwd redisinsight/ install --ignore-optional
  yarn install
  yarn build:statics
  yarn build:prod
  yarn electron-builder build --dir -p never
}

package() {
  cd "$srcdir/RedisInsight-$pkgver/release/linux-unpacked"
  install -Dm644 resources/resources/icons/512x512.png "${pkgdir}/usr/share/pixmaps/redisinsight.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "RedisInsight" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Development' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 resources/LICENSE.redisinsight.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -avR * "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/redisinsight "${pkgdir}/usr/bin/redisinsight"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}
