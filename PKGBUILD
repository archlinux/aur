# Maintainer : Zak BlueSwordM <neutronpcxt@gmail.com>

pkgname=svt-av1-psy-git
pkgver=2.0.0.rc2.r2.gc233913e
pkgrel=2
pkgdesc='Bleeding edge psycho-visually focused fork of SVT-AV1'
arch=('x86_64')
url='https://github.com/gianni-rosato/svt-av1-psy'
license=('BSD' 'custom: Alliance for Open Media Patent License 1.0')
depends=('glibc')
makedepends=('git' 'cmake' 'yasm')
provides=('svt-av1' 'svt-av1-git')
conflicts=('svt-av1' 'svt-av1-git')
source=('git+https://github.com/gianni-rosato/svt-av1-psy')
sha256sums=('SKIP')

pkgver() {
    git -C svt-av1-psy describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export LDFLAGS+=' -Wl,-z,noexecstack'
    cmake -B build -S svt-av1-psy \
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
    install -D -m644 svt-av1-psy/{LICENSE,PATENTS}.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
