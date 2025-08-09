# Maintainer: taotieren <admin@taotieren.com>

pkgbase=dmlc-core-git
pkgname=dmlc-core-git
pkgver=0.5.r44.gcbab4ef
pkgrel=2
pkgdesc="A common bricks library for building scalable and portable distributed machine learning."
arch=($CARCH)
url="https://github.com/dmlc/dmlc-core"
license=('Apache-2.0')
groups=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
)
makedepends=(
    cmake
    dlpack
    git
    ninja
    pkgconf
    arrow
    curl
    openmp
    openssl
)
checkdepends=(
)
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"

    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
