# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: mstmob
# Contributor: xiota
# Contributor: thorou

_pkgname=cura
pkgname=$_pkgname-bin
pkgver=5.7.0
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
  "https://github.com/Ultimaker/Cura/releases/download/${pkgver}/UltiMaker-Cura-${pkgver}-linux-X64.AppImage"
  'AppRun.env.patch'
  'UltiMaker-Cura'
)

sha512sums=(
  '52f63aa25ee9a87020667b8bcf0e6fed9fa31059ca7905bad784e6433e053c48065f911226326e06f3d77e4fdcd84f28fa69ccdcb287321fc097edc39ab017c9'
  'd818e675e0c0792ebf9210ee90cdc59a993bc5893195d051d33e2a4948e6d473d13200c60bd0c9784456e2da0f8f5e93a0e955d833af7f8fef9a08ef6cfa1811'
  '5565018aa35bf0b8b76ed3bcba6f6808fd6a70fd5504895ee48f1fe9ae58767e752705d5d10dbe85d26c572a08185260d20f30ef4f3d2e931c285e65341c2472'
)

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 UltiMaker-Cura-${pkgver}-linux-X64.AppImage
  ./UltiMaker-Cura-${pkgver}-linux-X64.AppImage --appimage-extract
  hardlink --content --maximize squashfs-root
  cd squashfs-root
  sed -i 's|^Comment=.*|Comment=Cura converts 3D models into paths for a 3D printer. It prepares your print for maximum accuracy, minimum printing time and good reliability with many extra features that make your print come out great.|' com.ultimaker.cura.desktop
  sed -i 's|^Icon=|Icon=/usr/share/pixmaps/|' com.ultimaker.cura.desktop
  printf '%s\n' 'MimeType=model/stl;application/vnd.ms-3mfdocument;application/prs.wavefront-obj;image/bmp;image/gif;image/jpeg;image/png;text/x-gcode;application/x-amf;application/x-ply;application/x-ctm;model/vnd.collada+xml;model/gltf-binary;model/gltf+json;model/vnd.collada+xml+zip;' >> com.ultimaker.cura.desktop
  printf '%s\n' 'Keywords=3D;Printing;' >> com.ultimaker.cura.desktop
  patch -p1 < ../AppRun.env.patch
}

package() {
  install -Dm755 UltiMaker-Cura "$pkgdir/usr/bin/UltiMaker-Cura"
  ln -s /usr/bin/UltiMaker-Cura "$pkgdir/usr/bin/cura"
  install -Dm644 squashfs-root/com.ultimaker.cura.desktop "$pkgdir/usr/share/applications/com.ultimaker.cura.desktop"
  install -Dm644 squashfs-root/cura-icon.png "$pkgdir/usr/share/pixmaps/cura-icon.png"
  install -dm755 "$pkgdir/opt"
  mv squashfs-root "$pkgdir/opt/ultimaker-cura"
}
