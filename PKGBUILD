# Maintainer: Blake

: ${_electron_dist:=/usr/lib/electron}

_pkgname="horizon-electron"
pkgname="fchat-horizon"
pkgver=1.30.1
pkgrel=1
pkgdesc="A continuation of the heavily modified F-Chat Rising client. Uses system electron."
url="https://github.com/Fchat-Horizon/Horizon"
license=('MIT')
arch=('any')

depends=(
  'electron'
  'libnotify'
  'libsecret'
  'libappindicator-gtk3'
)
makedepends=(
  'git'
  'nodejs'
  'pnpm'
  'npm'
)
provides=(
  'fchat=3'
)
source=(
  "$pkgname::git+https://github.com/Fchat-Horizon/Horizon#tag=v$pkgver"
  'fchat.desktop'
)
sha256sums=('79ca98734b7291f791a74dc84f5c857b06ac49f1cf5cb654ebc586b787c07b71'
            'edd24949c861656c3ce667ae919f42b41495877dae600a1e2d2570e869ae4ead')

prepare() {
  local _electron_version="$(cat $_electron_dist/version)"
  sed -E -e 's#("electron"): "[^"]+",#\1: "'${_electron_version}'",#' \
    -i "$srcdir/$pkgname/package.json"
}

build() {
  export HOME="$srcdir/tmp_home"
  export XDG_CACHE_HOME="$srcdir/tmp_cache"
  export XDG_CONFIG_HOME="$srcdir/tmp_config"
  export XDG_DATA_HOME="$srcdir/tmp_data"
  export XDG_STATE_HOME="$srcdir/tmp_state"
  
  cd $pkgname
  pnpm install
  cd electron
  pnpm install
  node ../webpack production
  pnpm -c exec "electron-builder --linux --dir -c.electronDist=${_electron_dist} -c.electronVersion=$(cat $_electron_dist/version)"
}

package() {
  # Set up the built executable
  install -d "$pkgdir"/opt/$pkgname
  cp -a "$srcdir"/$pkgname/electron/dist/linux-unpacked/. "$pkgdir"/opt/$pkgname
  chmod 755 "$pkgdir"/opt/$pkgname/$_pkgname

  # Create symlink to executable
  install -d "$pkgdir"/usr/bin
  ln -s /opt/$pkgname/$_pkgname "$pkgdir"/usr/bin/$pkgname

  # Move .desktop file
  install -d "$pkgdir"/usr/share/applications
  cp "$srcdir"/fchat.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Move icon
  install -d "$pkgdir"/usr/share/pixmaps
  cp "$srcdir"/$pkgname/electron/build/icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # Licenses
  install -Dm644 "$srcdir"/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
