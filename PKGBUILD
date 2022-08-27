# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgbase=obs-vkcapture
pkgname=("$pkgbase" "lib32-$pkgbase")
pkgver=1.2.0
pkgrel=1
url="https://github.com/nowrep/$pkgbase"
license=('GPL2')
arch=('x86_64')
depends=('vulkan-icd-loader' 'libgl' 'obs-studio>=27')
makedepends=('gcc' 'cmake' 'vulkan-headers' 'lib32-gcc-libs' 'lib32-vulkan-icd-loader' 'lib32-libgl')
source=("https://github.com/nowrep/$pkgbase/archive/v1.2.0.tar.gz")
sha512sums=('e30aeb24af467a9f8a343985b77ea5cd4e39fdcdec067f3c65f7dd9b8915a933bff1ee5127e4a7a4eaa0e740f97f31af669cb5a75155bbd9937d694d739a6d7d')

build() {
    cmake -B build -S "$pkgbase-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_DATADIR=/share \
        -DCMAKE_BUILD_TYPE=Release
    make -C build

    export CFLAGS="-m32 ${CFLAGS}"
    export CXXFLAGS="-m32 ${CXXFLAGS}"
    export LDFLAGS="-m32 ${LDFLAGS}"

    cmake -B build32 -S "$pkgbase-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DCMAKE_INSTALL_DATADIR=/share \
        -DCMAKE_LIBRARY_PATH=/usr/lib32 \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_PLUGIN=OFF
    make -C build32
}

package_obs-vkcapture() {
    pkgdesc='OBS Linux Vulkan/OpenGL game capture'

    make -C build DESTDIR="$pkgdir" install
}

package_lib32-obs-vkcapture() {
    pkgdesc='OBS Linux Vulkan/OpenGL game capture (32-bit)'
    depends=('lib32-vulkan-icd-loader' 'lib32-libgl')

    make -C build32 DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/bin"
}
