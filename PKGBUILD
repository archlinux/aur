# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=proton-mail
pkgver=1.0.5
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/ProtonMail/inbox-desktop/releases/download/$pkgver/inbox-desktop-$pkgver-source.zip"
        "$pkgname.desktop")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('86967d7f07afd09495e160fe89dc35c49f47fcc4bc56ab9746a8df6505944073'
            '24cb263b7b61b5d64f49e4ead46d6f10c5d4a06599b0bb6334c3958721255fdb')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver/inbox-desktop-source"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install
}

build() {
  cd "$pkgname-$pkgver/inbox-desktop-source"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn package
}

package() {
  cd "$pkgname-$pkgver/inbox-desktop-source"
  install -d "$pkgdir/opt/$pkgname"
  cp -r out/Proton\ Mail-linux-x64/* "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -sf /opt/$pkgname/Proton\ Mail "$pkgdir/usr/bin/$pkgname"

  install -Dm644 assets/linux/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 assets/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 assets/icons/icon@2x.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024@2x/apps/$pkgname.png"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
