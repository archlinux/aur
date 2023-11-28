# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: mstmob
# Contributor: xiota

_pkgname=cura
pkgname=$_pkgname-bin
pkgver=5.6.0
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
  '5f543e146efb57d25159e90eb880ede0a1030d657a9a1cd02fbae78c791d877bedb425aa3b31cbedca86b9744a951b967cca2984b8a990044dd41505f07163d8'
  '1483c5572a6dec55d1849541cfe507dadb846176d3c7454c19f4fa6712c1d1d3451c4105fe8ddb0828e4d7db438579ca5abf0b8e080115a7266df8cc2b450234'
  '7840e0825d36bcc524f7ed8d10c94d545a276fe9772643e607fc4ca95f4b49a15c8f058add15bb3dbf134281d3b807fae0f76156623070dac1643e652f84bcae'
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
