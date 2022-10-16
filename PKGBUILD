# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=platinum-md-appimage
pkgver=1.2.1
pkgrel=1
pkgdesc='Graphical MiniDisc NetMD conversion and upload'
arch=('x86_64')
url='https://platinum-md.app/'
license=('MIT')
depends=()
provides=('platinum-md')
conflicts=('platinum-md')
options=('!strip')
noextract=("platinum-md-${pkgver}.AppImage")
source=("platinum-md-${pkgver}.AppImage::https://github.com/gavinbenda/platinum-md/releases/download/v${pkgver}/platinum-md-${pkgver}.AppImage"
        "platinum-md.desktop.patch"
        "platinum-md.sh")
sha256sums=('6a4abeabd75b86ce374662f0def34b0da2b8d46699d22ad50975fb20b63dab91'
            'a8bee953fba1c2cc6decee246b248cbadfea494399596d689b014160cf99cc0e'
            '48cabf82aa718504665acb181fd0dc91f26e8e6f636482e96ae9827ddb2dcb81')

prepare() {
  cd "${srcdir}"
  chmod +x platinum-md-${pkgver}.AppImage
  ./platinum-md-${pkgver}.AppImage --appimage-extract platinum-md.desktop
  ./platinum-md-${pkgver}.AppImage --appimage-extract usr/share/icons
  patch -Np0 <./platinum-md.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/platinum-md-${pkgver}.AppImage" "${pkgdir}/opt/appimages/platinum-md.AppImage"
  install -Dm755 "${srcdir}/platinum-md.sh" "${pkgdir}/usr/bin/platinum-md"

  install -dm755 "${pkgdir}/usr/share"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/platinum-md.desktop" "${pkgdir}/usr/share/applications/platinum-md.desktop"
}
