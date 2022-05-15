# Maintainer: xXR01I1Xx <xxr01i1xx@tuta.io>
pkgname=session-desktop
pkgver=1.10.4
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
            'fde2e8851d93a7a8ca2dc0338535362da3240208262d08155a594500e41a199b')

prepare() {
  cd $srcdir/session-desktop
  git checkout v$pkgver
  source /usr/share/nvm/init-nvm.sh && nvm install 16
  git lfs install
  nvm install
  nvm use
}

build() {
  cd "$srcdir/session-desktop"
  source /usr/share/nvm/init-nvm.sh && nvm use --delete-prefix v16 --silent
  export SIGNAL_ENV=production
  yarn install
  yarn generate
  export SIGNAL_ENV=production
  $(yarn bin)/electron-builder --config.extraMetadata.environment=$SIGNAL_ENV --publish=never --config.directories.output=release --linux tar.xz
}

package() {
  install -d "${pkgdir}/usr/"{lib,bin}

  cp -a $srcdir/session-desktop/release/linux-unpacked $pkgdir/usr/lib/$pkgname

  install -Dm644 $srcdir/session-desktop/build/session_icon_source_1024px.png $pkgdir/usr/share/pixmaps/$pkgname.png

  for size in 16 32 48 64 128 256 512 1024; do
      install -Dm644 "${srcdir}/session-desktop/build/icons/icon_${size}x${size}.png" \
          "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done

  install -Dm644 $srcdir/session-desktop.desktop $pkgdir/usr/share/applications/${pkgname}.desktop

  ln -s "/usr/lib/${pkgname}/session-desktop" "${pkgdir}/usr/bin/"
}
