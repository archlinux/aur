# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Simon Allen <simon@simonallen.org>
pkgname=ytmdesktop-git
pkgver=2.1.0.r0.geb7c5d9
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
  export PNPM_HOME="$srcdir/pnpm-home"
  _ensure_local_nvm
  nvm install "${_nodeversion}"
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname%-git}"
  export PNPM_HOME="$srcdir/pnpm-home"
  _ensure_local_nvm
  pnpm make --targets="@electron-forge/maker-zip"
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r out/YouTube\ Music\ Desktop\ App-linux-x64/. "$pkgdir/opt/${pkgname%-git}"

  install -Dm644 src/assets/icons/ytmd.png \
    "$pkgdir/usr/share/pixmaps/youtube-music-desktop-app.png"
  install -Dm644 "$srcdir/youtube-music-desktop-app.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/youtube-music-desktop-app" "$pkgdir/usr/bin/"
}
