# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Simon Allen <simon@simonallen.org>
pkgname=ytmdesktop-git
pkgver=2.0.10.r0.g68d3e5d
pkgrel=1
_nodeversion=22
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.github.io"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'libnotify'
  'libxtst'
  'nss'
  'xdg-utils'
)
makedepends=(
  'git'
  'nvm'
  'python'
  'yarn'
  'zip'
)
optdepends=(
  'libgnome-keyring'
  'lsb-release'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ytmdesktop/ytmdesktop.git'
        'youtube-music-desktop-app.desktop')
sha256sums=('SKIP'
            '90db79917962cd630c223e54bddd6e4150ec2d399a6cf5e75ffd9f83e926703c')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  cd "${pkgname%-git}"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  _ensure_local_nvm
  nvm install "${_nodeversion}"
  yarn config set enableTelemetry 0
  yarn --immutable
}

build() {
  cd "${pkgname%-git}"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  _ensure_local_nvm
  yarn make --targets="@electron-forge/maker-zip"
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r out/YouTube\ Music\ Desktop\ App-linux-x64/. "$pkgdir/opt/${pkgname%-git}"
  chmod 4755 "$pkgdir/opt/${pkgname%-git}/chrome-sandbox"

  install -Dm644 src/assets/icons/ytmd.png \
    "$pkgdir/usr/share/pixmaps/youtube-music-desktop-app.png"
  install -Dm644 "$srcdir/youtube-music-desktop-app.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/youtube-music-desktop-app" "$pkgdir/usr/bin/"
}
