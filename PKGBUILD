# Maintainer: Nicolas Goy <kuon@goyman.com>

pkgname=front-panel-designer-eu
pkgver=6.3.6
pkgrel=2
epoch=
pkgdesc="Free CAD software for front panel design"
arch=("any")
url="http://www.schaeffer-ag.de/en/"
license=('custom')
groups=()
depends=(libpng12)
makedepends=(appimagetool)
options=(!strip)
source_x86_64=(
"https://assets.schaeffer-ag.de/fpd/Version-$pkgver/FrontDesign-EU-$pkgver-amd64.AppImage"
"front-panel-express-eu.desktop")
md5sums_x86_64=("95268b130b2fa2b1af0289f639920998" "d34b7ed5d87a206fe8b50fd4a8f8e167")
noextract=("FrontDesign-EU-$pkgver-amd64.AppImage")


prepare() {
    rm FrontDesign-EU-$pkgver-amd64.AppImage
    cp -L ../FrontDesign-EU-$pkgver-amd64.AppImage .
}

build() {
    chmod a+x FrontDesign-EU-$pkgver-amd64.AppImage
    rm -rf tmp
    mkdir tmp
    cd tmp
    ../FrontDesign-EU-$pkgver-amd64.AppImage --appimage-extract

    # fix AppImage
    rm squashfs-root/usr/lib/libgmodule-2.0.so.0

    # save and unset SOURCE_DATE_EPOCH for appimagetool
    _SOURCE_DATE_EPOCH=$SOURCE_DATE_EPOCH
    unset SOURCE_DATE_EPOCH

    appimagetool squashfs-root ../FrontDesign-EU-$pkgver-amd64.AppImage

    # restore SOURCE_DATE_EPOCH
    export SOURCE_DATE_EPOCH=$_SOURCE_DATE_EPOCH
}

package() {
  install -Dm 755 \
       "$srcdir/FrontDesign-EU-$pkgver-amd64.AppImage" \
       "$pkgdir/opt/FrontDesignEU/FrontDesignEU.AppImage"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/FrontDesignEU/FrontDesignEU.AppImage" "$pkgdir/usr/bin/FrontDesignEU"

  install -Dm 644 \
      "$srcdir/front-panel-express-eu.desktop" \
      "$pkgdir/usr/share/applications/front-panel-express-eu.desktop"
}
