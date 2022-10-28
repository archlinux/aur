# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: mstmob
# Contributor: xiota

_pkgname=cura
pkgname=$_pkgname-bin
pkgver=5.2.1
pkgrel=2
pkgdesc='State-of-the-art slicer app to prepare your 3D models for your 3D printer'
url='https://ultimaker.com/software/ultimaker-cura'
license=('LGPL3')
arch=('x86_64')
depends=('fuse2' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')

source=(
  "https://github.com/Ultimaker/Cura/releases/download/${pkgver}/Ultimaker-Cura-${pkgver}-linux-modern.AppImage"
  'cura.sh'
  'cura-engine.sh'
)

sha512sums=(
  '9274e16e27a35f3308d7555a4a576a4122478006bb0746db2b48b6b6e9ee038ca03cb4a3a1b58c001b933a92aa696e07ffd49151b1a22b04ea56b64cfe59dea8'
  'bb31ff6c4b4a96ed40f3edc7057fff5cf29bfe9bd91e18fab60a6d43c531cdc6b0844d5f03301b23b836949e209644ec8ca79b4ce1dc9712b9fff4d31e4c89ef'
  'dfddc5055017171ca4a9dac91b08b17e8d6585ae0211321fef7ea891b2c4b6f7f8a1a8b8de189a3cb7da104870c9db1fb4ee6cb7234f198b3d4a5d4bf7671dd8'
)

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 Ultimaker-Cura-${pkgver}-linux-modern.AppImage
  ./Ultimaker-Cura-${pkgver}-linux-modern.AppImage --appimage-extract
}

package() {
  install -Dm755 cura-engine.sh "$pkgdir/usr/bin/CuraEngine"
  install -Dm755 cura.sh "$pkgdir/usr/bin/Ultimaker-Cura"
  ln -s /usr/bin/Ultimaker-Cura "$pkgdir/usr/bin/cura"
  install -Dm644 squashfs-root/cura.desktop "$pkgdir/usr/share/applications/cura.desktop"
  install -Dm644 squashfs-root/cura-icon.png "$pkgdir/usr/share/pixmaps/cura-icon.png"
  install -dm755 "$pkgdir/opt"
  mv squashfs-root "$pkgdir/opt/ultimaker-cura"
}
