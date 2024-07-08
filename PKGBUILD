# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ufprog-git
pkgname=ufprog-git
pkgver=r154.12a5948
pkgrel=1
groups=()
pkgdesc="Universal Flash Programmer"
arch=($CARCH)
url="https://github.com/hackpascal/ufprog"
license=('GPL-2.0-only AND LGPL-2.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(glibc)
makedepends=(git
    cmake
    hidapi
    libusb
    json-c
    ninja)
optdepends=()
source=(
#     "${pkgname}::git+${url}.git"
    "${pkgname}::git+https://github.com/taotieren/ufprog.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    git switch fix-build
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE=None \
    -DBUILD_PORTABLE=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -B build \
    -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
