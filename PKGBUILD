# Maintainer: taotieren <admin@taotieren.com>

pkgname=tinybpt-git
pkgver=r28.b490fcc
pkgrel=2
epoch=
pkgdesc="Tinybpt (Tiny Buildroot Packaging Tool) 是一个 buildroot 的包管理工具，主要处理 buildroot 的包依赖关系，提供包的安装、卸载等功能。"
arch=($CARCH)
url="https://gitee.com/tinylab/buildroot-toolkit"
license=(GPL-2.0-or-later)
groups=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    bash
    gcc-libs
    glibc
    openssl
)
makedepends=(
    git
    cmake
    nlohmann-json
    ninja
)
optdepends=("buildroot-meta: dependency requirements for buildroot")
checkdepends=()
options=()
source=(${pkgname}::git+$url.git
    "tinybpt_cacert.pem::https://curl.se/ca/cacert.pem"
    "CMakeLists.patch"
)
noextract=()
sha256sums=('SKIP'
            'a3f328c21e39ddd1f2be1cea43ac0dec819eaa20a90425d7da901a11531b3aa5'
            'aef37c794e79637913ceb23a9a300c51cf4d3264ab48837c82209f4bf6c3cddb')

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
    patch -p1 <${srcdir}/CMakeLists.patch
}

build() {
    cp -rv ${srcdir}/tinybpt_cacert.pem ${srcdir}/${pkgname}

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -S ${pkgname} \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/build install
}
