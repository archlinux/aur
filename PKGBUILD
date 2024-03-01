# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ytmdesktop
pkgver=2.0.2
pkgrel=1
_nodeversion=20
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.app"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libxtst' 'nss' 'xdg-utils')
makedepends=('git' 'nvm' 'python' 'yarn' 'zip')
optdepends=('libgnome-keyring'
            'lsb-release')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytmdesktop/ytmdesktop/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('5c0f4f7883da16aaf192ccbf10a4bfae704c5b4a352f6917a3baa0d0de87d92f'
            '05a97a350ffe07c1dfdf064dfc223ab4b38efc89942ba196d90c64a88a5afb3e'
            'cef9bd688fa6a77fe800192d38ec647c9ca3b146abb54cf08947c67f47b467d1')

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
  install -Dm644 src/assets/icons/ytmd.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/youtube-music-desktop-app" "$pkgdir/usr/bin/"
}
