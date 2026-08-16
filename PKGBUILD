# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_pkgname=rockchip-mpp
pkgname=rockchip-mpp-llvm
pkgver=1.1.0
pkgrel=2
epoch=1
pkgdesc='Rockchip Media Process Platform (MPP) — built with Clang and LLVM lld'
arch=('x86_64')
url='https://github.com/rockchip-linux/mpp/'
license=('Apache-2.0' 'MIT')
depends=(
    'glibc'
    'libstdc++')
makedepends=(
    'clang'
    'cmake'
    'lld'
    'llvm')
provides=('rockchip-mpp')
conflicts=('rockchip-mpp')
source=("https://github.com/rockchip-linux/mpp/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        '010-rockchip-mpp-silence-unwanted-log-messages.patch'
        '020-rockchip-mpp-enable-clang-toolchain.patch')
sha256sums=('7bb0040f364468ad9abbb71a04553ebc6a5814584e083c2fc9a553783e9656df'
            'bdec0c21ffdeadf128d670a304be59eccb253e45ff78a1ee70a0f4b305ff05e0'
            'fa04fbb6a1e149fb13c68ae637853169b2ec74551c586c8e58e4102ced023fc4')

prepare() {
    patch -d "mpp-${pkgver}" -Np1 -i "${srcdir}/010-rockchip-mpp-silence-unwanted-log-messages.patch"
    patch -d "mpp-${pkgver}" -Np1 -i "${srcdir}/020-rockchip-mpp-enable-clang-toolchain.patch"
}

build() {
    export CC=clang
    export CXX=clang++
    export AR=/usr/bin/llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
    export LD=/usr/bin/ld.lld
    export NM=/usr/bin/llvm-nm
    export OBJCOPY=/usr/bin/llvm-objcopy
    export OBJDUMP=/usr/bin/llvm-objdump
    export READELF=/usr/bin/llvm-readelf
    export STRIP=/usr/bin/llvm-strip
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    export CFLAGS="${CFLAGS:-} -O3 -march=native"
    export CXXFLAGS="${CXXFLAGS:-} -O3 -march=native"
    export CFLAGS+=" -ffile-prefix-map=${srcdir}=. -fdebug-prefix-map=${srcdir}=."
    export CXXFLAGS+=" -ffile-prefix-map=${srcdir}=. -fdebug-prefix-map=${srcdir}=."
    
    cmake -B build -S "mpp-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_STRIP:PATH='/usr/bin/strip' \
        -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld" \
        -DENABLE_VPROC_VDPP:BOOL='ON' \
        -Wno-author
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "mpp-${pkgver}/LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
