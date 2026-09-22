# Maintainer: myuan <provefars@gmail.com>
pkgname=tad-desktop
pkgver=0.14.0
pkgrel=1
pkgdesc='Tabular data viewer using the system Electron runtime'
arch=('x86_64')
url='https://www.tadviewer.com/'
license=('MIT')
depends=('electron44')
makedepends=('nodejs-lts-iron' 'npm' 'python')
conflicts=('tad-bin')
options=('!debug' '!lto')

_electronver=44.4.3
source=(
  "tad-${pkgver}.tar.gz::https://github.com/antonycourtney/tad/archive/refs/tags/v${pkgver}.tar.gz"
  "node-v${_electronver}-headers.tar.gz::https://artifacts.electronjs.org/headers/dist/v${_electronver}/node-v${_electronver}-headers.tar.gz"
  'tad-system-electron.patch'
  'duckdb-gcc16.patch'
  'tad.sh'
  'tad.desktop'
)
sha256sums=(
  'd2618dda492421aacabdbe3915a158161054291b83f4809079b8945a6b9cb993'
  '168d0427ce4c5673e021dfa40ddd36458f87ea10189ef1e10b0b5acb047425ed'
  '58a1ed58a26a55c86ee3c90f869756a4830f7cbe79e1d9a6ddf54176cc7c9235'
  '78da86fd62430cd87585f3dabc17821cce535263b92a479478613732dc7c400e'
  '8cd8292af74b7a0dc8903f2f4181cfd49e166e5a041fc088d0370b009eb7ff0e'
  'e7a942e5f74c7710f7923a30c05842c2b607533485c446dd4f07dd9e2e1d95af'
)

prepare() {
  cd "tad-${pkgver}"
  patch -Np1 -i ../tad-system-electron.patch
}

build() {
  cd "tad-${pkgver}"

  export npm_config_cache="$srcdir/npm-cache"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  npm_config_ignore_scripts=true npm ci
  npm_config_ignore_scripts=true \
    ./node_modules/.bin/lerna bootstrap --ci --hoist --force-local --ignore-prepublish

  patch -Np1 -i ../duckdb-gcc16.patch

  npm_config_build_from_source=true \
    npm_config_nodedir=/usr \
    npm rebuild node-sass

  npm_config_build_from_source=true \
    npm_config_runtime=electron \
    npm_config_target="${_electronver}" \
    npm_config_nodedir="$srcdir/node_headers" \
    npm_config_arch=x64 \
  npm_config_target_arch=x64 \
    npm rebuild duckdb

  rm -r node_modules/duckdb/build

  ./tools/build-embedded.sh

  cd packages/tad-app
  npm run build-prod
  ../../node_modules/.bin/electron-builder --linux --x64 --dir \
    -c.directories.output="$srcdir/electron-out" \
    -c.electronDist=/usr/lib/electron44 \
    -c.electronVersion="${_electronver}" \
    -c.npmRebuild=false
}

package() {
  cd "tad-${pkgver}"
  local resources="$srcdir/electron-out/linux-unpacked/resources"

  install -d "$pkgdir/usr/lib/tad"
  install -m644 "$resources/app.asar" "$pkgdir/usr/lib/tad/app.asar"
  cp -a "$resources/app.asar.unpacked" "$pkgdir/usr/lib/tad/"
  cp -a "$resources/examples" "$pkgdir/usr/lib/tad/"

  install -Dm755 "$srcdir/tad.sh" "$pkgdir/usr/bin/tad"
  install -Dm644 "$srcdir/tad.desktop" \
    "$pkgdir/usr/share/applications/tad.desktop"
  install -Dm644 packages/tad-app/res/AppIcon1024.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/tad.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
