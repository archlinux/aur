# Maintainer: Roland Auer <xxr01i1xx@tuta.io>
pkgname=session-desktop-git
pkgver=1.0.4
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=(x86_64)
url="https://getsession.org"
license=('GPL-3.0')
depends=(libxtst nss alsa-lib libxss libnotify xdg-utils)
makedepends=('git' 'nvm' 'yarn')
optdepends=('libappindicator-gtk3: for tray support')
provides=(session-messenger-desktop)
conflicts=(session-desktop session-desktop-bin session-desktop-appimage)
options=(!strip)
install=$pkgname.install
source=('git+https://github.com/loki-project/session-desktop.git'
        'session-desktop.desktop')
sha256sums=('SKIP'
            '931e317b69e5c5ed3ef1f2ff0c82bf72b8706ab5ac50ad0564f3f164d7d5f7b8')

prepare() {
  cd $srcdir/session-desktop
  git checkout 9dc8160
  source /usr/share/nvm/init-nvm.sh
  nvm install 10.13.0
  export SIGNAL_ENV=production
}

build() {
  cd "$srcdir/session-desktop"
  nvm use 10.13.0
  yarn install --frozen-lockfile
  yarn generate
  yarn lint-full
  $(yarn bin)/electron-builder --config.extraMetadata.environment=$SIGNAL_ENV --publish=never --config.directories.output=release --linux tar.xz
}

package() {
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/opt/
  mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/apps/
  tar xf $srcdir/session-desktop/release/session-messenger-desktop-linux-x64-$pkgver.tar.xz -C $pkgdir/opt/
  mv $pkgdir/opt/session-messenger-desktop-linux-x64-$pkgver $pkgdir/opt/Session
  cp $srcdir/session-desktop/images/session/icon_256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/images/session/icon_64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop.desktop $pkgdir/usr/share/applications/
}
