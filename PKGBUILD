# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=libkrunfw-git
pkgver=v2.0.0.r76.g481975e
pkgrel=1
pkgdesc="A dynamic library bundling the guest payload consumed by libkrun"
arch=("x86_64")
url="https://github.com/containers/libkrunfw"
license=("GPL2")
depends=("bc")
makedepends=("cargo" "git" "gcc" "python-pyelftools")
provides=("libkrunfw")
conflicts=("libkrunfw")
source=("${pkgname}::git+https://github.com/containers/libkrunfw")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname}"
    make -j4
}

package() {
    cd "${pkgname}"
    make install PREFIX="$pkgdir/usr"
    if [ -d "$pkgdir/usr/lib64" ]; then
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
    fi
}
