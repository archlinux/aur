# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: mstmob
# Contributor: xiota

_pkgname=cura
pkgname=$_pkgname-bin
pkgver=5.2.1
pkgrel=4
pkgdesc='State-of-the-art slicer app to prepare your 3D models for your 3D printer'
url='https://ultimaker.com/software/ultimaker-cura'
license=('LGPL3')
arch=('x86_64')
depends=('fuse2' 'xdg-desktop-portal')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')

source=(
  "https://github.com/Ultimaker/Cura/releases/download/${pkgver}/Ultimaker-Cura-${pkgver}-linux-modern.AppImage"
  'AppRun-Ultimaker-Cura.patch'
  'AppRun-CuraEngine.patch'
)

sha512sums=(
  '9274e16e27a35f3308d7555a4a576a4122478006bb0746db2b48b6b6e9ee038ca03cb4a3a1b58c001b933a92aa696e07ffd49151b1a22b04ea56b64cfe59dea8'
  'bf5fa289d8f4193e186a0d8d7e5dc5e902789674bf6c2a068655d639f1be1e7c9d9757c4709801f10c86501c6722a94a97051f662f6d1d85294d1cba16145f63'
  '76e0a856eec5dfcb7ab8025c07f4665305d717a7f674408a87429583fdf70af86dbbe0d45908f7f3ec0e91833f006cb3eacc8531627ba1acf389921c0d2468e8'
)

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 Ultimaker-Cura-${pkgver}-linux-modern.AppImage
  ./Ultimaker-Cura-${pkgver}-linux-modern.AppImage --appimage-extract
  patch -Np1 -F5 -o Ultimaker-Cura squashfs-root/AppRun AppRun-Ultimaker-Cura.patch
  patch -Np1 -F5 -o CuraEngine squashfs-root/AppRun AppRun-CuraEngine.patch
  hardlink --content --maximize squashfs-root
}

package() {
  install -Dm755 Ultimaker-Cura "$pkgdir/usr/bin/Ultimaker-Cura"
  ln -s /usr/bin/Ultimaker-Cura "$pkgdir/usr/bin/cura"
  install -Dm755 CuraEngine "$pkgdir/usr/bin/CuraEngine"
  ln -s /usr/bin/CuraEngine "$pkgdir/usr/bin/cura-engine"
  install -Dm644 squashfs-root/cura.desktop "$pkgdir/usr/share/applications/cura.desktop"
  install -Dm644 squashfs-root/cura-icon.png "$pkgdir/usr/share/pixmaps/cura-icon.png"
  install -dm755 "$pkgdir/opt"
  mv squashfs-root "$pkgdir/opt/ultimaker-cura"
}
