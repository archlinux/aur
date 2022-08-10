# Maintainer: xXR01I1Xx <xxr01i1xx@tuta.io>
pkgname=session-desktop
pkgver=1.9.0
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=(x86_64)
url="https://getsession.org"
license=('GPL-3.0')
depends=(libxtst nss alsa-lib libxss libnotify xdg-utils)
makedepends=('git' 'git-lfs' 'nvm' 'yarn' 'nodejs>=14.16.0')
optdepends=('libappindicator-gtk3: for tray support')
provides=(session-messenger-desktop)
conflicts=(session-desktop-bin session-desktop-git session-desktop-appimage)
options=(!strip)
install=$pkgname.install
source=('git+https://github.com/loki-project/session-desktop.git'
        'session-desktop.desktop')
sha256sums=('SKIP'
            '0c409a40e96e7b1437e9b2f19fddfb63f587b0ad262560a02de32b1469c6d0ff')

prepare() {
  cd $srcdir/session-desktop
  git checkout v$pkgver
  source /usr/share/nvm/init-nvm.sh && nvm install 14.16.0
  git lfs install
  nvm install
  nvm use
  yarn remove better-sqlite3
  yarn add https://github.com/signalapp/better-sqlite3.git#better-sqlcipher
}

build() {
  cd "$srcdir/session-desktop"
  source /usr/share/nvm/init-nvm.sh && nvm use --delete-prefix v14.16.0 --silent
  export SIGNAL_ENV=production
  yarn install
  yarn generate
  npm install
  yarn grunt
  $(yarn bin)/electron-builder --config.extraMetadata.environment=$SIGNAL_ENV --publish=never --config.directories.output=release --linux tar.xz
}

package() {
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/opt/
  mkdir -p $pkgdir/usr/share/icons/hicolor/16x16/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/48x48/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/512x512/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/1024x1024/apps/

  cp $srcdir/session-desktop/build/icons/icon_16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/icon_32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/icon_48x48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/icon_64x64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/icon_128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/icon_256x256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/icon_512x512.png $pkgdir/usr/share/icons/hicolor/512x512/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/icon_1024x1024.png $pkgdir/usr/share/icons/hicolor/1024x1024/apps/session-messenger-desktop.png

  tar xf $srcdir/session-desktop/release/session-desktop-linux-x64-$pkgver.tar.xz -C $pkgdir/opt/
  mv $pkgdir/opt/session-desktop-linux-x64-$pkgver $pkgdir/opt/Session
  cp $srcdir/session-desktop.desktop $pkgdir/usr/share/applications/
}
