# Maintainer: Eduard Tolosa <edu4rdshl@pm.me>

pkgname=wowup-cf-beta-bin
_pkgname=wowup-cf-beta
_desktopname=WowUpCf
pkgver=2.23.1beta1
pkgrel=1
pkgdesc='WowUp the World of Warcraft addon updater (with CurseForge support) - Beta version'
arch=(x86_64)
url='https://github.com/WowUp/WowUp.CF'
license=("GPL3")
depends=(alsa-lib gtk3 hicolor-icon-theme mesa nss systemd-libs xdg-utils)
optdepends=(
  'libnotify: desktop notifications'
  'libsecret: keyring support'
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'wowup-cf-bin')
options=(!strip !debug)
source=(
  "WowUp-CF-${pkgver}.AppImage::https://github.com/WowUp/WowUp.CF/releases/download/v${pkgver//beta/-beta.}/WowUp-CF-${pkgver//beta/-beta.}.AppImage"
  'https://raw.githubusercontent.com/WowUp/WowUp.CF/main/LICENSE'
  "${_desktopname}.desktop"
  "${_pkgname}"
)
noextract=("WowUp-CF-${pkgver}.AppImage")
sha256sums=('3e4ac0a63348dc8f16f8a7359df36964ba9306db0be045114fcd04d10a27781f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '97386552c7ac77df8173436d4dd8a75d0e083ab4fd974bcd58147fac2e32adaa'
            '6740afe4ba04a95995c98139343b3e4ea504d3203e1faee1caa3712be9616c2d')

prepare() {
  cd "$srcdir"

  chmod +x "WowUp-CF-${pkgver}.AppImage"
  "./WowUp-CF-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a squashfs-root/. "$pkgdir/opt/$_pkgname/"
  rm -rf "$pkgdir/opt/$_pkgname"/{AppRun,.DirIcon,usr,wowup-cf.desktop,wowup-cf.png}
  chmod -R u+rwX,go+rX,go-w "$pkgdir/opt/$_pkgname"

  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname

  for _size in 16 32 512; do
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/${_size}x${_size}/apps/wowup-cf.png" \
      "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
  done
  install -Dm644 -t "$pkgdir/usr/share/applications" $_desktopname.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
