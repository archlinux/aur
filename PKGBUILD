# Maintainer: Roland Auer <xxr01i1xx@tuta.io>
pkgname=session-desktop-git
pkgver=5c11707
_ver=1.0.5
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
        'session-desktop.desktop'
        'patch.diff')
sha256sums=('SKIP'
            '931e317b69e5c5ed3ef1f2ff0c82bf72b8706ab5ac50ad0564f3f164d7d5f7b8'
            '4d78538aeaf7a898bf96fe9e42c10c690a57c562e2db3092f85dd94895b009d0')

prepare() {
  cd $srcdir/session-desktop
  git checkout $pkgver
  echo "Applying patch"
  git apply $srcdir/patch.diff
  source /usr/share/nvm/init-nvm.sh && nvm install 10.13.0
}

build() {
  cd "$srcdir/session-desktop"
  source /usr/share/nvm/init-nvm.sh && nvm use 10.13.0
  export SIGNAL_ENV=production
  yarn install --frozen-lockfile
  yarn generate
  yarn lint-full
  $(yarn bin)/electron-builder --config.extraMetadata.environment=$SIGNAL_ENV --publish=never --config.directories.output=release --linux tar.xz
}

package() {
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/opt/
  mkdir -p $pkgdir/usr/share/icons/hicolor/16x16/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/24x24/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/48x48/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/512x512/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/1024x1024/apps/

  cp $srcdir/session-desktop/build/icons/png/16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/png/24x24.png $pkgdir/usr/share/icons/hicolor/24x24/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/png/32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/png/48x48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/png/64x64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/png/128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/png/256x256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/png/512x512.png $pkgdir/usr/share/icons/hicolor/512x512/apps/session-messenger-desktop.png
  cp $srcdir/session-desktop/build/icons/png/1024x1024.png $pkgdir/usr/share/icons/hicolor/1024x1024/apps/session-messenger-desktop.png

  tar xf $srcdir/session-desktop/release/session-messenger-desktop-linux-x64-$_ver-$pkgver.tar.xz -C $pkgdir/opt/
  mv $pkgdir/opt/session-messenger-desktop-linux-x64-$_ver-$pkgver $pkgdir/opt/Session
  cp $srcdir/session-desktop.desktop $pkgdir/usr/share/applications/
}
