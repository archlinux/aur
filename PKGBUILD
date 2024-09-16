# Maintainer: taotieren <admin@taotieren.com>

pkgbase=qdap-git
pkgname=qdap-git
pkgver=r38.e3bf1fe
pkgrel=1
groups=()
pkgdesc="cmsis-dap upper by a Qt"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/ma6254/QDAP"
license=('GPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    gcc-libs
    glibc
    libusb
    hidapi
    qt5-base
    yaml-cpp)
makedepends=(git
    cmake
    ninja
    qt5-tools
    pkgconf)
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

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
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -S ${pkgname} \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/build install
}
