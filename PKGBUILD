# Maintainer: Jason Stryker <inbox at jasonstryker dot com>

pkgbase=gallium-nine
pkgname=('gallium-nine' 'lib32-gallium-nine')
pkgver=0.1
pkgrel=1
pkgdesc="Gallium Nine Standalone"
arch=('x86_64')
url="https://github.com/dhewg/nine"
license=('LGPL2')
makedepends=('git' 'wine' 'mesa' 'meson')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c1ef8d1cb7f35802f92012fd18258cd59c0218f78d7bf43bf0073cc47a51f99e8649177b163a85b4bcdf6379ca96db09249df90a5f13f0371814e6d18ee36a9b')

build() {
    cd ${srcdir}/nine-${pkgver}
    
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

    cd ${srcdir}/nine-${pkgver}

    DESTDIR="$pkgdir" ninja -C "build$1" install

}

package_gallium-nine() {
    provides=("gallium-nine")
    depends=('mesa')

    _package_gallium-nine 64

    mkdir -p "$pkgdir/usr/bin"
    install -Dm 0755 "tools/nine-install.sh" "${pkgdir}/usr/bin/" 

}

package_lib32-gallium-nine() {
    provides=("lib32-gallium-nine")
    depends=('gallium-nine' 'lib32-mesa')

    _package_gallium-nine 32

}
# vim:set ts=2 sw=2 et:
