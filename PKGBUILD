# Maintainer: taotieren <admin@taotieren.com>

pkgname=c6-git
pkgver=0.1.0+r0+gf72a870
pkgrel=1
pkgdesc="c6 — TinyCC with language extensions"
arch=($CARCH)
url="https://github.com/c6lang/c6"
license=('LGPL-2.0-or-later')
provides=(${pkgname%-git} tcc)
conflicts=(${pkgname%-git} tcc)
depends=(
    'glibc'
)
makedepends=(
    'cmake'
    'git'
)
checkdepends=(
    'go'
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
    install -vDm0644 tcc/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
