# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: syntheit <daniel@matv.io>
pkgname=tagspaces
pkgver=5.7.9
pkgrel=1
_electronversion=27
pkgdesc="An offline, open source, document manager with tagging support"
arch=('x86_64')
url="https://www.tagspaces.org"
license=('AGPL-3.0-or-later')
depends=("electron${_electronversion}" 'libnotify' 'libsecret' 'xdg-utils')
makedepends=('git' 'libxcrypt-compat' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tagspaces/tagspaces/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('8ab1bfd8920795a09499ca87b1c159e99b5e14c1ffdbf815ab13423d5e322c78'
            'a548e2b62a61a93d80482ebe43ef11e33e2c2bfef9db641fc583bd5539ac6948'
            '6a0d3ca0f31afdd7587b3dc0ed819f252c350eaeafb17472fe4b7031d4130118')

prepare() {
  cd "$pkgname-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"

  # Modify build target
  sed -i 's/"deb", "tar.gz", "appImage"/"deb"/g' resources/builder.json

  # Skip husky
  mkdir -p .git
  npm run skip:husky:pre-commit

  npm install
  npm run install-ext-node

  # A key is required in order for the main application to communicate with the web server
  cd release/app
  touch .env
  generated_key=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 128)
  echo "KEY=${generated_key}" > .env

  sed -i "s|@ELECTRONVERSION@|electron${_electronversion}|" "$srcdir/$pkgname.sh"
}

build() {
  cd "$pkgname-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  npm run install-ext-node-linux
  npm exec -c "ts-node ./.erb/scripts/clean.js"
  npm run build
  npm exec -c "electron-builder --linux --config resources/builder.json \
    ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer}"
}

package() {
  install -Dm644 builds/linux-unpacked/resources/app.asar -t \
    "$pkgdir/usr/lib/$pkgname/"
  cp -r builds/linux-unpacked/resources/app.asar.unpacked -t \
    "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  cd "$pkgname-$pkgver"
  install -Dm644 assets/icons/256x256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 assets/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
}
