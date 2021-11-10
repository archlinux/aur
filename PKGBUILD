pkgname=youtube-music-git
pkgver=1.14.0.r0.gf40ed04
pkgrel=1
_nodeversion=14
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('x86_64')
url="https://th-ch.github.io/youtube-music"
license=('MIT')
depends=('electron' 'libsecret')
makedepends=('git' 'nvm' 'yarn')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/th-ch/youtube-music.git'
        "${pkgname%-git}.sh"
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'a1d30cedc17ede48b7d627a3797a0918b7bd3c9062e9ed83d61f153c001c1ef8'
            '07af59376e13e5dae2e7e38fa09d734a5147d5c344b3aed84c2f3afe22b8af79')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
#  Use Node.js 14
  _ensure_local_nvm
  nvm install "$_nodeversion"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  electronDist=/usr/lib/electron
  electronVer=$(sed s/^v// /usr/lib/electron/version)
  _ensure_local_nvm
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn install
  yarn run clean
  npx electron-builder --linux dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-git}"
  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 license -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  for icon_size in 16 24 32 48 64 128 256 512 1024; do
    icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -Dm644 assets/generated/icons/png/${icon_size}x${icon_size}.png \
      $pkgdir$icons_dir/${pkgname%-git}.png
  done
}
