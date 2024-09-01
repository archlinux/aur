# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: mstmob
# Contributor: xiota
# Contributor: thorou
# Contributor: sausix

_pkgname=cura
pkgname=$_pkgname-bin
pkgver=5.8.1
pkgrel=1
pkgdesc='State-of-the-art slicer app to prepare your 3D models for your 3D printer'
url='https://ultimaker.com/software/ultimaker-cura'
license=('LGPL3')
arch=('x86_64')
depends=('fuse2' 'xdg-desktop-portal')
optdepends=('mesa: for use with the closed source nvidia driver under wayland')
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
  '7d50eb25690ab0c8beb350d50fcd8cc5435d61f599b2bf9046e476cc7efb88b50821b4333ef33ffc6f428d700a2c3afee924d9b57eefe49c4131a9e6dbfa5000'
  '833f5d8e73ed142bfe67dc0b22b10dc914bd2a5208c83301387a590ba59909e047ad8bb2b3e3b916fe81d673374f90fbfdf003bcb2d336efa2c1fb0ce9c2d072'
  '706bfd5d7f46ba859fa1caddefe18504a8e82cd494d0279b5207191cdf2bca102e47bb4feee94d93d41a36e2f4aa5d71d2d2a398cbdcee8fd5c3d22b6b00a2de'
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
  rm "$pkgdir/opt/ultimaker-cura/libwayland-client.so.0" # Use the system version of libwayland-client.so.0 so it's compatible with the latest mesa (thanks sausix)
}
