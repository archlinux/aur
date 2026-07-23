# Maintainer: gigas002 <gigas002@pm.me>

pkgname=wowup-cf-bin
_pkgname=wowup-cf
_desktopname=WowUpCf
pkgver=2.23.0
pkgrel=1
epoch=1
pkgdesc="WowUp the World of Warcraft addon updater (with CurseForge support)"
arch=(x86_64)
url="https://github.com/WowUp/WowUp.CF"
license=("GPL3")
depends=(alsa-lib gtk3 hicolor-icon-theme mesa nss systemd-libs xdg-utils)
optdepends=(
  'libnotify: desktop notifications'
  'libsecret: keyring support'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip !debug)
source=(
  "WowUp-CF-${pkgver}.AppImage::https://github.com/WowUp/WowUp.CF/releases/download/v${pkgver//beta/-beta.}/WowUp-CF-${pkgver//beta/-beta.}.AppImage"
  "https://raw.githubusercontent.com/WowUp/WowUp.CF/main/LICENSE"
  "${_desktopname}.desktop"
  "${_pkgname}"
)
noextract=("WowUp-CF-${pkgver}.AppImage")
sha256sums=('e7dea3fa2d934dbce919f756c33ce840aa41e800f6aea4f486f1789ef6c3df60'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '55f16d4a88caa1ba3cce8c5732b6767556257d7ca9d07605b1cae502b4493247'
            '8baa237bd7dbd69a1a6533faba6b46bf64b4a67448464181d14655fcb65b5952')

prepare() {
  cd "$srcdir"

  chmod +x "WowUp-CF-${pkgver}.AppImage"
  "./WowUp-CF-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a squashfs-root/. "$pkgdir/opt/$_pkgname/"
  rm -rf "$pkgdir/opt/$_pkgname"/{AppRun,.DirIcon,usr,$_pkgname.desktop,$_pkgname.png}
  chmod -R u+rwX,go+rX,go-w "$pkgdir/opt/$_pkgname"

  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname

  for _size in 16 32 512; do
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png" \
      "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
  done
  install -Dm644 -t "$pkgdir/usr/share/applications" $_desktopname.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

