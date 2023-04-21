# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: mstmob
# Contributor: xiota

_pkgname=cura
pkgname=$_pkgname-bin
pkgver=5.3.1
pkgrel=1
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
  "https://github.com/Ultimaker/Cura/releases/download/${pkgver}/UltiMaker-Cura-${pkgver}-linux-modern.AppImage"
  'AppRun-UltiMaker-Cura.patch'
  'AppRun-CuraEngine.patch'
)

sha512sums=(
  '81bb4ecdd050b0d2eaaa7ed45251a2613ce83084e7e57ba4a0d660c71d59bac22e2cad47531fedefe7d00dbdc0781834fa8604ef95c7342d68bdcbd465afa38b'
  'bf5fa289d8f4193e186a0d8d7e5dc5e902789674bf6c2a068655d639f1be1e7c9d9757c4709801f10c86501c6722a94a97051f662f6d1d85294d1cba16145f63'
  '5a005722d6b97abe9b8fce1aa74877b5be75ec58f03afb3049d4a4df431caf4e8aba825716696f010557ac1682bfecc9e4133297c3280528af4be2e30b560860'
)

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 UltiMaker-Cura-${pkgver}-linux-modern.AppImage
  ./UltiMaker-Cura-${pkgver}-linux-modern.AppImage --appimage-extract
  patch -Np1 -F5 -o UltiMaker-Cura squashfs-root/AppRun AppRun-UltiMaker-Cura.patch
  patch -Np1 -F5 -o CuraEngine squashfs-root/AppRun AppRun-CuraEngine.patch
  hardlink --content --maximize squashfs-root
}

package() {
  install -Dm755 UltiMaker-Cura "$pkgdir/usr/bin/UltiMaker-Cura"
  ln -s /usr/bin/UltiMaker-Cura "$pkgdir/usr/bin/cura"
  install -Dm755 CuraEngine "$pkgdir/usr/bin/CuraEngine"
  ln -s /usr/bin/CuraEngine "$pkgdir/usr/bin/cura-engine"
  install -Dm644 squashfs-root/cura.desktop "$pkgdir/usr/share/applications/cura.desktop"
  install -Dm644 squashfs-root/cura-icon.png "$pkgdir/usr/share/pixmaps/cura-icon.png"
  install -dm755 "$pkgdir/opt"
  mv squashfs-root "$pkgdir/opt/ultimaker-cura"
}
