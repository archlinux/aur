# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ytmdesktop
pkgver=2.0.10
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytmdesktop/ytmdesktop/archive/refs/tags/v$pkgver.tar.gz"
        'youtube-music-desktop-app.desktop')
sha256sums=('5ebf7577b5ff64c108a6afc70b32f4cf63d8d7836a4c8e83f150ff02302fdec0'
            '90db79917962cd630c223e54bddd6e4150ec2d399a6cf5e75ffd9f83e926703c')

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
  cd "$pkgname-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  _ensure_local_nvm
  nvm install "${_nodeversion}"
  yarn config set enableTelemetry 0
  yarn --immutable
}

build() {
  cd "$pkgname-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  _ensure_local_nvm
  yarn make --targets="@electron-forge/maker-zip"
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/opt/$pkgname"
  cp -r out/YouTube\ Music\ Desktop\ App-linux-x64/. "$pkgdir/opt/$pkgname"
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  install -Dm644 src/assets/icons/ytmd.png \
    "$pkgdir/usr/share/pixmaps/youtube-music-desktop-app.png"
  install -Dm644 "$srcdir/youtube-music-desktop-app.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/youtube-music-desktop-app" "$pkgdir/usr/bin/"
}
