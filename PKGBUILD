# Maintainer: taotieren <admin@taotieren.com>

pkgname=openiximg-git
pkgver=r17.9c7d143
pkgrel=1
pkgdesc="A comprehensive toolset for handling Allwinner IMAGEWTY format firmware images"
arch=($CARCH)
url="https://github.com/YuzukiTsuru/OpenixIMG"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    gcc-libs
    glibc
)
makedepends=(
    #clang
    #llvm
    cmake
    git
    pkgconf
)
optdepends=(
    "openixcard: Open Source Version of Allwinner PhoenixCard on Linux"
)
source=("${pkgname}::git+${url}.git"
    "git+https://github.com/YuzukiTsuru/twofish.git"
    "git+https://github.com/YuzukiTsuru/rc6.git"
)
sha256sums=('SKIP'
            'SKIP'
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
    git submodule init
    git config submodule.lib/twofish.url "$srcdir/twofish"
    git config submodule.lib/rc6.url "$srcdir/rc6"
    git -c protocol.file.allow=always submodule update
}

build() {
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build

    cmake --build "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
