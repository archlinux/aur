# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Simon Allen <simon@simonallen.org>
pkgname=ytmdesktop-git
pkgver=1.14.0.r97.g45ed2e7
pkgrel=1
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.app"
license=('CC0 1.0 Universal')
depends=('electron11')
makedepends=('git' 'npm' 'nvm')
optdepends=('libnotify: for desktop notifications'
            'libappindicator-gtk3: for tray icon'
            'nss-mdns: for companion server')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ytmdesktop/ytmdesktop.git#branch=development'
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '3ed0c519e62483bb411e258df6d100463b8a417930ea67b34844bde8464e143d'
            'f2b4520a6cf549f19567ebfeb337a4cb2ff5479c1d73a684cdd3bda62f1dd641')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_ensure_local_nvm() {
  # lets be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="$srcdir/.nvm"

  # The init script returns 3 if version
  # specified in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  export npm_config_cache="$srcdir/npm_cache"
  local nodeversion='12.22.4'
  local npm_prefix=$(npm config get prefix)
  npm config delete prefix
  _ensure_local_nvm
  nvm install "$nodeversion" && nvm use "$nodeversion"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  _ensure_local_nvm
  npm install --cache "$srcdir/npm-cache"
  npm run publish:lin

  # Restore node config from nvm
  npm config set prefix "$npm_prefix"
  nvm unalias default
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -dm755 "$pkgdir/usr/lib/${pkgname%-git}"
  cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/${pkgname%-git}"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"

  for icon_size in 16 256 512; do
    icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -d $pkgdir/$icons_dir
    install -m644 src/assets/favicon.${icon_size}x${icon_size}.png \
      $pkgdir/$icons_dir/${pkgname%-git}.png
  done

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications"
}
