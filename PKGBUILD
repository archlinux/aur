# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=proton-mail
pkgver=1.0.6
pkgrel=2
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/ProtonMail/inbox-desktop/releases/download/$pkgver/inbox-desktop-$pkgver-source.zip"
        "$pkgname.desktop")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('2144dbc7ed7811fe64bdf6bd4acd47e2dddde64bf52f3cfaee6e9d8ffb22ce8a'
            '24cb263b7b61b5d64f49e4ead46d6f10c5d4a06599b0bb6334c3958721255fdb')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install
}

build() {
  cd "$pkgname-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn make --targets="@electron-forge/maker-zip"
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/opt/$pkgname"
  cp -r out/Proton\ Mail-linux-*/* "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/Proton Mail" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 assets/linux/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 assets/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 assets/icons/icon@2x.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024@2x/apps/$pkgname.png"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
