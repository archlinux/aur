# Maintainer: Michael Dilger <mike@mikedilger.com>
# Maintainer: soloturn@gmail.com

pkgname=gossip-bin
_appname=gossip
pkgver=0.8.1
pkgrel=1
pkgdesc="gossip nostr client AppImage, built with rust, egui based."
arch=('x86_64')
url="https://github.com/mikedilger/gossip"
license=(MIT)
provides=($pkgname)
conflicts=('gossip' 'gossip-git')
source=(
  "$_appname.$pkgver.AppImage::https://github.com/mikedilger/$_appname/releases/download/v$pkgver/$_appname.$pkgver.AppImage"
  "LICENSE::https://github.com/mikedilger/gossip/releases/download/v$pkgver/LICENSE.txt"
  "$pkgname.desktop"
)
sha256sums=(
  '54a123f3366ae672be4339dff5364dce268339cabe6aa99d574c200eb4645f63'
  'e2860f22b4ae91017e138509f14a0c6c7e63aaae1bda7178b85020301b67cce4'
  '52fa1438918a2233a0cd01a5b0937667c55b4d3a5ab820e4025710a9b7319e5f'
)
prepare() {
  chmod a+x "${srcdir}/${_appname}.${pkgver}.AppImage"
  "${srcdir}/${_appname}.${pkgver}.AppImage" --appimage-extract > /dev/null
  sed "s|AppRun --no-sandbox %U|/usr/bin/${_appname}/bin|g" -i "${srcdir}/squashfs-root/cargo-appimage.desktop"
  mv "${srcdir}/squashfs-root/cargo-appimage.desktop" "${srcdir}/squashfs-root/${pkgname}.desktop"
}

package() {
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/bin" "${pkgdir}/usr/bin/${_appname}"
  install -Dm644 "${srcdir}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/squashfs-root/icon.png" -t "${pkgdir}/usr/share/pixmaps/${_appname}"  
}
