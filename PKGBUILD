# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=krunvm-git
pkgver=r48.ba9e585
pkgrel=4
pkgdesc="Create microVMs from OCI images"
arch=("x86_64")
url="https://github.com/containers/krunvm"
license=("GPL2")
depends=("libkrun" "buildah" "podman")
makedepends=("cargo" "git" "gcc" "asciidoctor")
provides=("krunvm")
conflicts=("krunvm")
source=("${pkgname}::git+https://github.com/containers/krunvm")
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
    make
}

package() {
    cd "${pkgname}"
    make install PREFIX="$pkgdir/usr"
    if [ -d "$pkgdir/usr/lib64" ]; then
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
    fi
}
