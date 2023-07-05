# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gmail-desktop
_pkgver=3.0.0-alpha.36
pkgver=${_pkgver//-/.}
pkgrel=1
_nodeversion=14
_electronversion=25
pkgdesc="Unofficial Gmail desktop app"
arch=('x86_64')
url="https://github.com/timche/gmail-desktop"
license=('MIT')
depends=("electron${_electronversion}")
makedepends=('nvm')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('0ac24a4c5db9fa5b0c9a46f0812014a9c95fb6c8b7443510f653b07cc35392f9'
            '061a908aff82379fbaaabdf0227479b4a9efed96a7558fd9fbe0f12da837b2cb'
            'b9a4fba1916c8b3e2ec55593b5700019c66c05a5da8f2f1b3f91edaddf0009dd')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="$srcdir/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "$pkgname-$_pkgver"

  # Disable husky
  sed -i '/husky/d' package.json

  _ensure_local_nvm
  nvm install "${_nodeversion}"
}

build() {
  cd "$pkgname-$_pkgver"
  electronDist="/usr/lib/electron$_electronversion"
  electronVer="$(sed s/^v// /usr/lib/electron$_electronversion/version)"
  _ensure_local_nvm
  export npm_config_cache="$srcdir/npm_cache"
  npm ci
  npm run build
  ./node_modules/.bin/electron-builder --linux --x64 --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$pkgname-$_pkgver"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r --no-preserve=ownership dist/linux-unpacked/resources \
    "$pkgdir/usr/lib/$pkgname"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
