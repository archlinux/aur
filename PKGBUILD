# Maintainer: trixsama <trix+aur at gmail.com>

_pkgname=svt-av1-essential
pkgname=${_pkgname}-git
pkgver=3.1.0.Essential.r0.g0d3bca9c
pkgrel=1
pkgdesc='A no-nonsense SVT-AV1 encoder fork with sensible defaults and Quality of Life improvements'
arch=('x86_64')
url='https://github.com/nekotrix/SVT-AV1-Essential'
license=('BSD' 'custom: Alliance for Open Media Patent License 1.0')
depends=('glibc')
makedepends=('git' 'cmake' 'nasm')
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
    install -D -m644 SVT-AV1-Essential/{LICENSE,PATENTS}.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
