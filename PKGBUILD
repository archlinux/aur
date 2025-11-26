# Maintainer : Roman Volkov <riv19-dev@pm.me>

pkgname=svt-av1-hdr-riv19-git
pkgver=3.1.2.r0.g5e224b57
pkgrel=2
pkgdesc='SVT-AV1-HDR is the SVT-AV1 Encoder with perceptual enhancements for SDR and HDR AV1 encoding (riv19 fork)'
arch=('x86_64')
url='https://github.com/riv19/svt-av1-hdr'
license=('BSD' 'custom: Alliance for Open Media Patent License 1.0')
depends=('glibc')
makedepends=('git' 'cmake' 'yasm')
provides=('svt-av1' 'svt-av1-git')
conflicts=('svt-av1' 'svt-av1-git' 'svt-av1-psy' 'svt-av1-psy-git')
source=('svt-av1-hdr-riv19::git+https://github.com/riv19/svt-av1-hdr')
sha256sums=('SKIP')

pkgver() {
    git -C svt-av1-hdr-riv19 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export LDFLAGS+=' -Wl,-z,noexecstack'
    cmake -B build -S svt-av1-hdr-riv19 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_AVX512=ON \
        -DNATIVE=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DSVT_AV1_LTO=ON
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 svt-av1-hdr-riv19/{LICENSE,PATENTS}.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
