# Maintainer: taotieren <admin@taotieren.com>

pkgname=stdexec-git
pkgver=25.09.r147.g970dbac
pkgrel=1
pkgdesc="Senders - A Standard Model for Asynchronous Execution in C++"
url="https://github.com/NVIDIA/stdexec"
arch=(any)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
license=('Apache-2.0')
depends=()
makedepends=(
    cmake
    git
    ninja
    meson
    pkgconf
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^nvhpc-//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    arch-meson ${pkgname} build
    ninja -C build
}

check() {
    meson test -C ${srcdir}/build
}

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
