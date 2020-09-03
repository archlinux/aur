# Maintainer: EHfive <eh5@sokka.cn>

pkgname=libldac-git
pkgver=2.0.2.3.r2.g8add977
pkgrel=2
pkgdesc="LDAC encoder and LDAC Adaptive Bit Rate(ABR) libraries"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/EHfive/ldacBT"
license=('Apache 2.0')
depends=()
makedepends=("cmake>=3.0" "git")
optdepends=()
provides=("libldac" "ldacBT" "libldacBT_enc.so" "libldacBT_abr.so")
conflicts=("libldac")
source=("git+https://github.com/EHfive/ldacBT.git"
        "git+https://android.googlesource.com/platform/external/libldac")

md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/ldacBT"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/ldacBT"
    git submodule init
    git config submodule.libldac.url "$srcdir/libldac"
    git submodule update --recursive
}

build() {
    cd "$srcdir/ldacBT"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_LIBDIR=/usr/lib \
        -DLDAC_SOFT_FLOAT=OFF \
        .
    make
}

package() {
    cd "$srcdir/ldacBT"
    make DESTDIR="$pkgdir" install
}
