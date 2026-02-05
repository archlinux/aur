# Maintainer : Zak BlueSwordM <neutronpcxt@gmail.com>

pkgname=svt-av1-psyex-git
pkgver=3.0.2.B.r9.g59d1a0256
pkgrel=1
pkgdesc='Bleeding edge psycho-visually focused fork of SVT-AV1. BlueSwordMs fork'
arch=('x86_64')
url='https://github.com/BlueSwordM/svt-av1-psyex'
license=('BSD' 'custom: Alliance for Open Media Patent License 1.0')
depends=('glibc')
makedepends=('git' 'cmake' 'yasm')
provides=('svt-av1' 'svt-av1-git')
conflicts=('svt-av1' 'svt-av1-git')
source=('git+https://github.com/BlueSwordM/svt-av1-psyex')
sha256sums=('SKIP')

pkgver() {
    git -C svt-av1-psyex describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export LDFLAGS+=' -Wl,-z,noexecstack'
    cmake -B build -S svt-av1-psyex \
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
    install -D -m644 svt-av1-psyex/{LICENSE,PATENTS}.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

