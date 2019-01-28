# Maintainer: EHfive <eh5@sokka.cn>

pkgname=libldac-git
pkgver=2.0.2.2.r0.g7edd608
pkgrel=1
pkgdesc="AOSP libldac dispatcher "
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/EHfive/ldacBT"
license=('Apache 2.0')
depends=()
makedepends=("cmake>=3.0" "make" "git")
optdepends=()
provides=("libldac" "ldacBT" "ldacBT_enc.so" "ldacBT_abr.so")
conflicts=("libldac")
source=("git+https://github.com/EHfive/ldacBT.git"
        "git+https://gitlab.com/eh5/libldac.git")

md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/ldacBT"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/ldacBT"
    rm -r libldac
    ln -sf -T "../libldac" "libldac"
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
