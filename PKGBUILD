# Maintainer: taotieren <admin@taotieren.com>

pkgname=c6-git
pkgver=0.6.2+r91+g07d73b8
pkgrel=1
pkgdesc="A c6 compiler that is self-booting, independent of TCC, and supports multiple backends (native x86-64 / C99 / LLVM IR)"
arch=($CARCH)
url="https://github.com/c6lang/c6"
license=('LGPL-2.0-or-later')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    'glibc'
)
makedepends=(
    'cmake'
    'git'
)
checkdepends=(
    'go'
    'python'
    'rust'
)
options=('docs' 'staticlibs' '!lto')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/+/g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    cmake -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DC6_TCC_SHARED_LIBTCC=ON \
        -B build 
    cmake --build build --parallel
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    ctest --test-dir build --output-on-failure
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    DESTDIR="${pkgdir}" cmake --install build
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
