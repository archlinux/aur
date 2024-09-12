# Maintainer: taotieren <admin@taotieren.com>

pkgbase=qdap-git
pkgname=qdap-git
pkgver=r37.9e40fb0
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
source=("${pkgname}::git+${url}.git"
    #     "git+https://github.com/jbeder/yaml-cpp.git"
    "git+https://github.com/ma6254/qdap_chips")
sha256sums=('SKIP'
            'SKIP')

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
    cd "${srcdir}/${pkgname}"
    git remote add taotieren https://github.com/taotieren/QDAP
    git fetch --all
    git checkout -b cmake taotieren/cmake
    #     git submodule init
    #     git config submodule.yaml-cpp.url "$srcdir/yaml-cpp"
    #     git -c protocol.file.allow=always submodule update
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
