# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Simon Allen <simon@simonallen.org>
pkgname=ytmdesktop-git
pkgver=2.0.0.rc.1.r1.g6efa7c4
pkgrel=1
_nodeversion=18
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.app"
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libxtst' 'nss' 'xdg-utils')
makedepends=('git' 'nvm' 'python' 'yarn' 'zip')
optdepends=('libgnome-keyring'
            'lsb-release')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ytmdesktop/ytmdesktop.git#branch=v2'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'cef9bd688fa6a77fe800192d38ec647c9ca3b146abb54cf08947c67f47b467d1')

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
  cd "$srcdir/${pkgname%-git}"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  _ensure_local_nvm
  nvm install "$_nodeversion"
  yarn --frozen-lockfile
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  _ensure_local_nvm
  yarn make --targets="@electron-forge/maker-zip"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r out/YouTube\ Music\ Desktop\ App-linux-x64/. "$pkgdir/opt/${pkgname%-git}"
  install -Dm644 src/assets/icons/ytmd.png \
    "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/youtube-music-desktop-app" "$pkgdir/usr/bin/"
}
