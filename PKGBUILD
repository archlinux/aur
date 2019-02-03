# Maintainer: Jason Stryker <inbox at jasonstryker dot com>

pkgbase=gallium-nine
pkgname=('gallium-nine' 'lib32-gallium-nine')
pkgver=0.2
pkgrel=1
pkgdesc="Gallium Nine Standalone"
arch=('x86_64')
url="https://github.com/iXit/wine-nine-standalone"
license=('LGPL2')
makedepends=('git' 'wine' 'mesa' 'meson')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('9eb687b68da875cb36298f7487c9f720c119b8be023577580e8829c241dedfb86ef516b3ef96c2fddd1412a05873c349390bd6e3ddc801bb20530c61f165cda6')

build() {
    cd ${srcdir}/wine-nine-standalone-${pkgver}
    
    sed -i "s#^BASE=.*#BASE=/usr/share/nine#g" "tools/nine-install.sh"

    sed "s/@PKG_CONFIG@/i686-pc-linux-gnu-pkg-config/" \
      < tools/cross-wine32.in \
      > tools/cross-wine32

    sed "s/@PKG_CONFIG@/x86_64-pc-linux-gnu-pkg-config/" \
      < tools/cross-wine64.in \
      > tools/cross-wine64

    meson \
      --cross-file "tools/cross-wine64" \
      --buildtype "release" \
      --prefix "/usr/share/nine" \
      --bindir bin64 \
      --libdir lib64 \
      "build64"

    ninja -C "build64"

    meson \
      --cross-file "tools/cross-wine32" \
      --buildtype "release" \
      --prefix "/usr/share/nine" \
      --bindir bin32 \
      --libdir lib32 \
      "build32"

    ninja -C "build32"

}

_package_gallium-nine() {

    cd ${srcdir}/wine-nine-standalone-${pkgver}

    DESTDIR="$pkgdir" ninja -C "build$1" install

}

package_gallium-nine() {
    provides=("gallium-nine")
    conflicts=("gallium-nine-git")
    depends=('mesa')

    _package_gallium-nine 64

    mkdir -p "$pkgdir/usr/bin"
    install -Dm 0755 "tools/nine-install.sh" "${pkgdir}/usr/bin/" 

}

package_lib32-gallium-nine() {
    provides=("lib32-gallium-nine")
    conflicts=("lib32-gallium-nine-git")
    depends=('gallium-nine' 'lib32-mesa')

    _package_gallium-nine 32

}
# vim:set ts=2 sw=2 et:
