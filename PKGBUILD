# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Carlos Ruiz <cailovirtual@gmail.com>

pkgname=taglib-sharp
pkgver=2.3.0.0
pkgrel=1
pkgdesc="Library for reading and writing metadata in media files for Mono"
arch=('any')
url="https://github.com/mono/taglib-sharp"
license=('LGPL2.1')
depends=('mono')
makedepends=('msbuild')
source=("https://github.com/mono/taglib-sharp/archive/TaglibSharp-${pkgver}.tar.gz"
        "taglib-sharp.pc")
sha256sums=('c96834a945369e07f9018959e38dafd3769237aec8ba3ffb2f460644da081a4e'
            '7b84254952a5a87f746f9927d866951683434c0ec5ed55a4995f69c5c2b5c7b3')

build() {
  cd ${srcdir}/${pkgname}-TaglibSharp-${pkgver}
  msbuild -restore TaglibSharp.sln /p:Configuration=Release
}

package() {
  cd ${srcdir}/${pkgname}-TaglibSharp-${pkgver}
  install -Dm755 src/Debug/bin/Release/net462/TagLibSharp.dll ${pkgdir}/usr/lib/mono/${pkgname}/TagLibSharp.dll
  gacutil -i ${pkgdir}/usr/lib/mono/${pkgname}/TagLibSharp.dll -root ${pkgdir}/usr/lib

  # install .pc file
  install -Dm644 "${srcdir}/${pkgname}.pc" "${pkgdir}/usr/lib/pkgconfig/${pkgname}.pc"
  sed -e "s|@PREFIX@|/usr|g" \
    -e "s|@VERSION@|${pkgver}|g" \
    -i "${pkgdir}/usr/lib/pkgconfig/${pkgname}.pc"
}
