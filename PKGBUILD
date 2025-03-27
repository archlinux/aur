# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=proton-mail
pkgver=1.8.0
pkgrel=1
_nodeversion=22
pkgdesc="Proton official desktop application for Proton Mail and Proton Calendar"
arch=('x86_64' 'aarch64')
url="https://proton.me"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'gvfs'
  'libdrm'
  'libnotify'
  'nss'
  'xdg-utils'
)
makedepends=(
  'git'
  'nvm'
  'yarn'
  'zip'
)
optdepends=(
  'kde-cli-tools: file deletion support (kioclient5)'
  'libgnome-keyring'
  'lsb-release'
  'trash-cli: file deletion support (trash-put)'
)
conflicts=('protonmail-desktop')
_commit=7a01897bc833a544c1360572ced583ceb604ca24  # 1.8.0
source=("git+https://github.com/ProtonMail/WebClients.git#commit=${_commit}"
        "$pkgname.desktop"
        '0001-fix-webpack-config.patch')
sha256sums=('0de4a59f74b5b4da9755455ecf6aa8eaa9515c9092f764cac940e12c8838b534'
            '24cb263b7b61b5d64f49e4ead46d6f10c5d4a06599b0bb6334c3958721255fdb'
            '390856b2972a8b54953261ebfd0caf27f30fd91d44c0046acffe27aab41d55ba')

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
  cd WebClients

  # https://github.com/ProtonMail/WebClients/issues/418
  patch -Np1 -i ../0001-fix-webpack-config.patch

  _ensure_local_nvm
  nvm install "${_nodeversion}"
  
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install
}

build() {
  cd WebClients
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  _ensure_local_nvm
  yarn workspace proton-inbox-desktop make --targets="@electron-forge/maker-zip"
}

package() {
  cd WebClients
  install -d "$pkgdir/opt/$pkgname"
  cp -r applications/inbox-desktop/out/Proton\ Mail-linux-*/* "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/Proton Mail" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 applications/inbox-desktop/assets/linux/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 applications/inbox-desktop/assets/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 applications/inbox-desktop/assets/icons/icon@2x.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024@2x/apps/$pkgname.png"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
