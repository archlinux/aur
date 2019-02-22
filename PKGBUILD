# Maintainer: Jason Stryker <inbox at jasonstryker dot com>
# Contributor: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgbase=gallium-nine-git
pkgname=('gallium-nine-git' 'lib32-gallium-nine-git')
pkgver=0.r272.966fc5c
pkgrel=1
pkgdesc="Gallium Nine Standalone (Git Version)"
arch=('x86_64')
url="https://github.com/iXit/wine-nine-standalone"
license=('LGPL2')
makedepends=('git' 'wine' 'mesa' 'meson')
source=("git+https://github.com/iXit/wine-nine-standalone.git")
sha512sums=('SKIP')

pkgver() {
    cd wine-nine-standalone
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/wine-nine-standalone
    
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

_package_gallium-nine-git() {

    cd ${srcdir}/wine-nine-standalone

    DESTDIR="$pkgdir" ninja -C "build$1" install

}

package_gallium-nine-git() {
    provides=("gallium-nine")
    conflicts=("gallium-nine")
    depends=('mesa')

    _package_gallium-nine-git 64

    mkdir -p "$pkgdir/usr/bin"
    install -Dm 0755 "tools/nine-install.sh" "${pkgdir}/usr/bin/nine-install" 

}

package_lib32-gallium-nine-git() {
    provides=("lib32-gallium-nine")
    conflicts=("lib32-gallium-nine")
    depends=('gallium-nine' 'lib32-mesa')

    _package_gallium-nine-git 32

}
# vim:set ts=2 sw=2 et:
