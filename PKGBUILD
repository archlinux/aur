# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ytmdesktop
pkgver=2.1.0
pkgrel=1
_nodeversion=26
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.github.io"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'libnotify'
  'libsecret'
  'libxtst'
  'nss'
  'xdg-utils'
)
makedepends=(
  'git'
  'nvm'
  'pnpm'
  'python'
  'zip'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytmdesktop/ytmdesktop/archive/refs/tags/v$pkgver.tar.gz"
        'youtube-music-desktop-app.desktop')
sha256sums=('dde400bc5d345c61153c996569a151f2603495a2a17636b5d14929e20b59c57f'
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
  export PNPM_HOME="$srcdir/pnpm-home"
  _ensure_local_nvm
  nvm install "${_nodeversion}"
  pnpm install --frozen-lockfile
}

build() {
  cd "$pkgname-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  _ensure_local_nvm
  pnpm make --targets="@electron-forge/maker-zip"
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/opt/$pkgname"
  cp -r out/YouTube\ Music\ Desktop\ App-linux-x64/. "$pkgdir/opt/$pkgname"

  install -Dm644 src/assets/icons/ytmd.png \
    "$pkgdir/usr/share/pixmaps/youtube-music-desktop-app.png"
  install -Dm644 "$srcdir/youtube-music-desktop-app.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/youtube-music-desktop-app" "$pkgdir/usr/bin/"
}
