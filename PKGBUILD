# Maintainer: gilbus <aur (AT) tinkershell.eu>

pkgbase=immich-public-proxy
pkgname=(immich-public-proxy immich-public-proxy-upload)
pkgver=4.2.0
pkgrel=1
pkgdesc='Share Immich photos and albums publicly without exposing your Immich instance'
arch=('any')
url='https://github.com/alangrainger/immich-public-proxy'
license=('AGPL-3.0-only')
depends=('nodejs')
makedepends=('npm')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'immich-public-proxy.service'
        'immich-public-proxy-upload.service'
        'immich-public-proxy.env'
        'immich-public-proxy-upload.env')
sha256sums=('766aa9fbb2ecf1712aedf44e13fdc63cf40f1bc94e985c3c46fa8e9b5a2a7a3f'
            '6734e1ae8f507fc9c0bba211d057fa130d7b22102a03ac2b7b1b4350fc4ef629'
            'e530739d37990ec767dd8bbbebb5040bbc95ff22e08cad6c5acf48078e6d63bd'
            'e27b4e6b775d425d9ce86a2d1564119ac26b96dd3bc9f65db70de9b4ea2dca24'
            'f30fa855c502013597e8495ac0a311b998db6d7f4d55a150e2697d76d48111a9')

_npm() {
  npm --cache "$srcdir/npm-cache" --no-audit --no-fund --update-notifier=false "$@"
}

# Builds a self-contained production node_modules for one workspace
# (same approach as upstream's Dockerfile / Dockerfile.upload).
_stage_prod() {
  local ws=$1
  local stage="$srcdir/stage-$ws"
  local out="$srcdir/modules-$ws"

  rm -rf "$stage" "$out"
  mkdir -p "$stage"/{app,upload-app}

  # npm ci needs the manifest of every workspace listed in the root package.json
  cp package.json package-lock.json "$stage/"
  cp app/package.json "$stage/app/"
  cp upload-app/package.json "$stage/upload-app/"
  cp -r shared "$stage/shared"              # includes the compiled @ipp/core
  rm -rf "$stage/shared/node_modules"

  (
    cd "$stage"
    # Everything is already cached by prepare(), so no network access is needed here
    _npm ci --offline --omit=dev --ignore-scripts --workspace="$ws"
    rm -rf node_modules/immich-public-proxy \
           node_modules/immich-public-proxy-upload \
           node_modules/.bin
    cp -rL node_modules "$out"              # turn the @ipp/core symlink into a real folder
  )

  rm -rf "$out/@ipp/core/"{src,tests,tsconfig.json,vitest.config.ts,dist/tsconfig.tsbuildinfo}
}

_install_app() {
  local ws=$1
  local dest="$pkgdir/usr/lib/$pkgname"

  cd "$srcdir/$pkgbase-$pkgver"

  install -d "$dest"
  install -m644 "$ws/package.json" "$dest/package.json"
  cp -r "$ws/dist" "$ws/public" "$dest/"
  cp -r "$srcdir/modules-$ws" "$dest/node_modules"
  rm -f "$dest/dist/tsconfig.tsbuildinfo"
  chmod -R u=rwX,go=rX "$dest"

  # The app reads ../config.json relative to dist/, so put the real file in /etc
  install -Dm644 "$ws/config.json" "$pkgdir/etc/$pkgname/config.json"
  ln -s "/etc/$pkgname/config.json" "$dest/config.json"
  install -Dm644 "$srcdir/$pkgname.env" "$pkgdir/etc/$pkgname/environment"

  install -Dm644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  sed -i "s/@PKGVER@/$pkgver/" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

prepare() {
  cd "$pkgbase-$pkgver"
  # All network access happens here (full install, including dev dependencies)
  _npm ci
}

build() {
  cd "$pkgbase-$pkgver"
  _npm run build --workspaces   # order: shared -> app -> upload-app
  _stage_prod app
  _stage_prod upload-app
}

check() {
  cd "$pkgbase-$pkgver"
  _npm test --workspaces --if-present
}

package_immich-public-proxy() {
  optdepends=('immich-public-proxy-upload: let share visitors upload photos to Immich')
  backup=('etc/immich-public-proxy/config.json'
          'etc/immich-public-proxy/environment')
  _install_app app
}

package_immich-public-proxy-upload() {
  pkgdesc='Upload service for Immich Public Proxy: lets share visitors send photos back to Immich'
  backup=('etc/immich-public-proxy-upload/config.json'
          'etc/immich-public-proxy-upload/environment')
  _install_app upload-app
}

