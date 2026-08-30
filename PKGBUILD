# Maintainer: Aria Quinlan <hello@aria.coffee>

_pkgname=svt-av1-essential-extra
pkgname=${_pkgname}-git
pkgver=4.0.1.Essential.r3.g5c4a386e9
pkgrel=1
pkgdesc='A no-nonsense SVT-AV1 encoder fork with sensible defaults and Quality of Life improvements. Now with extra build flags like WebM and FFMS2 and built with clang'
arch=('x86_64')
url='https://github.com/nekotrix/SVT-AV1-Essential'
license=('BSD' 'custom: Alliance for Open Media Patent License 1.0')
depends=('glibc' 'ffms2') # I need to find what deps specifically are needed for dovi and hdr10 to enable it
makedepends=('git' 'cmake>=3.23' 'nasm' 'clang')
provides=('svt-av1' 'svt-av1-git')
conflicts=('svt-av1' 'svt-av1-git')
source=('git+https://github.com/nekotrix/SVT-AV1-Essential')
sha256sums=('SKIP')

pkgver() {
    git -C SVT-AV1-Essential describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export LDFLAGS+=' -Wl,-z,noexecstack'
    cmake -B build -S SVT-AV1-Essential \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_AVX512=ON \
        -DNATIVE=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DSVT_AV1_LTO=ON \
        -DUSE_FFMS2=ON \
        -DUSE_WEBM_IO=ON \

    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 SVT-AV1-Essential/{LICENSE,PATENTS}.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
