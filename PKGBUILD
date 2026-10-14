# Maintainer: Kelly Guo <guojiyou40020@hotmail.com>

pkgname=capy-ai-bin
_pkgname=capy-ai
pkgver=0.4.6
pkgrel=1
pkgdesc="Capy runs your coding agents in the cloud"
arch=('x86_64' 'aarch64')
url="https://capy.ai"
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libgcc'
  'libnotify'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
optdepends=(
  'libsecret: store credentials in the system keyring'
  'libappindicator-gtk3: tray icon on some desktops'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$_pkgname.desktop")
source_x86_64=("$_pkgname-$pkgver-x86_64.AppImage::https://downloads.capy.ai/stable/capy-$pkgver-x86_64.AppImage")
source_aarch64=("$_pkgname-$pkgver-aarch64.AppImage::https://downloads.capy.ai/stable/capy-$pkgver-arm64.AppImage")
sha256sums=('db798f3d048bea2cee12a5e3b4adfcecd2bdc69c64e952aa7ccb08d294ae304e')
sha256sums_x86_64=('7e8646ba869682cc1ed086274730bec579e405d681548553cfe0831577bd3c8e')
sha256sums_aarch64=('b76b6ac1538317af1b6063d93c94e43c482998696677bdac0e239c69690b94d0')

prepare() {
  rm -rf squashfs-root
  chmod +x "$_pkgname-$pkgver-$CARCH.AppImage"
  "./$_pkgname-$pkgver-$CARCH.AppImage" --appimage-extract >/dev/null
}

package() {
  cd squashfs-root

  # Drop AppImage-only files and the bundled libs that AppRun would add to
  # LD_LIBRARY_PATH; the system versions come in through depends.
  rm -rf AppRun .DirIcon capy.desktop capy.png usr/lib

  # Install the hicolor icons under our own name, then drop usr/ from the app dir
  local _icon
  for _icon in usr/share/icons/hicolor/*/apps/capy.png; do
    install -Dm644 "$_icon" "$pkgdir/${_icon%capy.png}$_pkgname.png"
  done
  rm -rf usr

  install -d "$pkgdir/opt/$_pkgname"
  cp -a . "$pkgdir/opt/$_pkgname/"
  find "$pkgdir/opt/$_pkgname" -type d -exec chmod 755 {} +
  chmod -R go-w "$pkgdir/opt/$_pkgname"
  chmod 4755 "$pkgdir/opt/$_pkgname/chrome-sandbox"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/capy" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/$_pkgname/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  ln -s "/opt/$_pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
