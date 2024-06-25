# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: alphazo <archlinux-1229 at notracking dot email>
pkgname=proton-mail
pkgver=1.0.4
pkgrel=1
pkgdesc="Proton official desktop application for Proton Mail and Proton Calendar"
arch=('x86_64')
url="https://proton.me"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'gvfs'
  'libdrm'
  'libnotify'
  'nss'
)
makedepends=('git' 'yarn')
optdepends=(
  'kde-cli-tools: file deletion support (kioclient5)'
  'pipewire: WebRTC desktop sharing under Wayland'
  'trash-cli: file deletion support (trash-put)'
  'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)'
)
conflicts=('protonmail-desktop')
source=("proton-mail-$pkgver.tar.gz::https://github.com/ProtonMail/inbox-desktop/releases/download/v$pkgver/inbox-desktop-$pkgver-source.zip"
        'proton-mail.desktop')
noextract=("${source[@]%%::*}")
sha256sums=('001063b7b7836d7d2e57c311475106196c3660e1138ba322840b40dbb5acc9b3'
            '24cb263b7b61b5d64f49e4ead46d6f10c5d4a06599b0bb6334c3958721255fdb')


prepare() {
  mkdir -p "proton-mail-$pkgver"
  bsdtar xvf "proton-mail-$pkgver.tar.gz" -C "proton-mail-$pkgver"

  cd "proton-mail-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install
}

build() {
  cd "proton-mail-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn package
}

package() {
  cd "proton-mail-$pkgver"
  install -d "$pkgdir/opt/proton-mail"
  cp -r out/Proton\ Mail-linux-x64/* "$pkgdir/opt/proton-mail"

  install -d "$pkgdir/usr/bin"
  ln -sf /opt/proton-mail/Proton\ Mail "$pkgdir/usr/bin/proton-mail"

  install -Dm644 assets/linux/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/proton-mail.svg"
  install -Dm644 assets/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/proton-mail.png"
  install -Dm644 assets/icons/icon@2x.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024@2x/apps/proton-mail.png"

  install -Dm644 "$srcdir/proton-mail.desktop" -t "$pkgdir/usr/share/applications/"
}
