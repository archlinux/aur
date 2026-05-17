# Maintainer: Reyka Matthies <openglfreak at googlemail dot com>

_pkgname=low_latency_layer
pkgname="$_pkgname-git"
pkgver=v0.1.0.r1.g4633ada
pkgrel=1
pkgdesc='Vulkan layer for hardware agnostic input latency reduction (Git version)'
arch=('any')
url='https://github.com/Korthos-Software/low_latency_layer'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('gcc-libs')
makedepends=('git' 'cmake' 'vulkan-headers' 'vulkan-utility-libraries' 'glslang' 'shaderc')
source=('git+https://github.com/Korthos-Software/low_latency_layer.git')
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cmake \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -GNinja -B"$srcdir"/build -Wno-dev
}

build() {
    cd "$_pkgname"
    cmake --build "$srcdir"/build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" cmake --install "$srcdir"/build
}
