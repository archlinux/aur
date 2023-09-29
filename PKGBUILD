# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: syntheit <daniel@matv.io>
pkgname=tagspaces
pkgver=5.5.1
pkgrel=1
_electronversion=25
pkgdesc="An offline, open source, document manager with tagging support"
arch=('x86_64')
url="https://www.tagspaces.org"
license=('AGPL3')
depends=("electron${_electronversion}" 'libnotify' 'libsecret' 'xdg-utils')
makedepends=('git' 'libxcrypt-compat' 'npm')
optdepends=('libappindicator-gtk3: Tray icon')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tagspaces/tagspaces/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('40c61766e8febd6b8bed7439bc8b0803a2fa4534b947e35ced6a11ca2861e88c'
            'a548e2b62a61a93d80482ebe43ef11e33e2c2bfef9db641fc583bd5539ac6948'
            '99a8679718609b93f61ac8119fbeb080ca0ec5e5f2d99b08e673fa86a3d8b32b')

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
  cd app
  touch .env
  generated_key=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 128)
  echo "KEY=${generated_key}" > .env
}

build() {
  cd "$pkgname-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  npm run build
  npm run install-ext-node-linux
  ./node_modules/.bin/electron-builder --linux --config resources/builder.json \
    ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer}
}

package() {
  install -Dm644 builds/linux-unpacked/resources/app.asar -t \
    "$pkgdir/usr/lib/$pkgname/"
  cp -r builds/linux-unpacked/resources/app.asar.unpacked -t \
    "$pkgdir/usr/lib/$pkgname/"
  for i in 16 32 48 64 128 256; do
    install -Dm644 "builds/.icon-set/icon_${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
    install -Dm644 builds/.icon-set/icon_512.png \
      "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  done
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
