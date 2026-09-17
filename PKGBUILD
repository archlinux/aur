# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=cashonize-appimage
pkgver=0.14.1
pkgrel=1
pkgdesc="A Bitcoin Cash (BCH) Wallet which supports CashTokens, WalletConnect and CashConnect."
provides=('cashonize')
conflicts=('cashonize')
arch=('x86_64')
depends=('fuse2')
url="https://cashonize.com/"
options=(!strip)
_desktop_name=cashonize-wallet.desktop
_filename=Cashonize-${pkgver}.AppImage
source=(
  https://github.com/cashonize/cashonize-wallet/releases/download/v${pkgver}/${_filename}
)
sha512sums=('ea48eeb77148e8f3c896b5ec56ca78b2d1b405a7c871e5958f6b0e39fadb3e65081788418832f56b5ccc91d2db7b9f42d0bb2ac9578c39e2ff894109a166bf5a')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/Cashonize.AppImage --no-sandbox|" \
          squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}"/usr/bin/Cashonize.AppImage
  echo "Installing desktop launcher"
  install -Dm755 squashfs-root/${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/cashonize-wallet.png ${pkgdir}/usr/share/pixmaps/cashonize-wallet.png
}
