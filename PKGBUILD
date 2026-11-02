# Maintainer  : Ateles
# Contributor : George Eleftheriou <eleftg>
 
pkgname=rtl-entropy-git
pkgver=0.1.2.r99.cf52a3b
pkgrel=1
pkgdesc="An entropy generator using SDR peripherals, including rtl-sdr and BladeRF"
url="https://github.com/pwarren/rtl-entropy"
license=('GPL3')
depends=('openssl' 'rtl-sdr')
makedepends=('git' 'cmake' 'pkgconfig')
arch=('x86_64')
provides=("rtl-entropy=${pkgver}")
conflicts=("rtl-entropy")
source=("master::git+https://github.com/pwarren/rtl-entropy")
sha512sums=('SKIP')

pkgver() {
  cd master
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    [ ! -d build ] && mkdir build
    sed -i 's/char\* manufacturer\[256\], product\[256\], serial\[256\];/char manufacturer[256], product[256], serial[256];/' \
        master/src/rtl_entropy.c
}

build() {
    cd build

    cmake ../master  \
        -DCMAKE_C_FLAGS="${CPPFLAGS} ${CFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
        -DCMAKE_MODULE_LINKER_FLAGS="${LDFLAGS}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX="/usr"

    make
}

package() {
    cd "${srcdir}/build"

    make DESTDIR="${pkgdir}" install
}
