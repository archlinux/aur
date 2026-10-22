# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=libkrun-git
pkgver=v1.19.7.r0.g43b2f5aa
pkgrel=1
pkgdesc="A dynamic library providing Virtualization-based process isolation capabilities"
arch=("x86_64")
url="https://github.com/containers/libkrun"
license=("GPL2")
depends=("libkrunfw")
makedepends=("cargo" "git" "gcc" "patchelf")
provides=("libkrun")
conflicts=("libkrun")
source=("${pkgname}::git+https://github.com/containers/libkrun#commit=43b2f5aadeebb90f42053c9df2ec8b16583e554f")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    ( set -o pipefail
      git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    make install PREFIX="$pkgdir/usr"
    if [ -d "$pkgdir/usr/lib64" ]; then
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
    fi
}
