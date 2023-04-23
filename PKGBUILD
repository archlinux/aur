# Maintainer: Nep_Nep <nepnep91 at protonmail dot com>
# Maintainer: xXR01I1Xx <xxr01i1xx@tuta.io>

pkgname=session-desktop-git
pkgver=v1.10.8.r0.g8ee731b2a
_semver="$(sed -E 's/v([0-9]+\.[0-9]+\.[0-9]+)\..+\.(.+)/\1-\2/g' <<< "$pkgver")"
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
        'session-desktop-git.install')
sha256sums=('SKIP'
            '18919ed91eddc64269256aaffe9b1abc864fbe2152c76e900e89799c1e9a1e9f'
            '6ec71b91d3f5f92e264bb3ebc1adfb6f75d2b75e2af3ce8db9f1dedc56bfc161')

pkgver() {
  cd "$srcdir/session-desktop"
  git checkout master &> /dev/null
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  git checkout clearnet &> /dev/null
}

prepare() {
  cd $srcdir/session-desktop
  echo "Applying patch"
  sed -i "s/\"version\": \".*\",/\"version\": \"$_semver\",/" package.json
  source /usr/share/nvm/init-nvm.sh && nvm install 16.13.0
}

build() {
  cd "$srcdir/session-desktop"
  source /usr/share/nvm/init-nvm.sh && nvm use --delete-prefix v16.13.0 --silent
  export SIGNAL_ENV=production
  yarn install --frozen-lockfile
  yarn build-everything
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

  tar xf $srcdir/session-desktop/release/session-desktop-linux-x64-$_semver.tar.xz -C $pkgdir/opt/
  mv $pkgdir/opt/session-desktop-linux-x64-$_semver $pkgdir/opt/Session
  cp $srcdir/session-desktop.desktop $pkgdir/usr/share/applications/
}
