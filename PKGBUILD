# Maintainer: taotieren <admin@taotieren.com>

pkgname=c6-git
pkgver=0.6.4+r458+g55db554
pkgrel=1
pkgdesc="Self-hosting C compiler (c6c) with defer, modules, generics, async/await and managed refs; .c6 enables extensions"
arch=($CARCH)
url="https://github.com/c6lang/c6"
license=('MIT')
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

# check() {
#     cd "${srcdir}/${pkgname%-git}"
#     ctest --test-dir build --output-on-failure
# }

package() {
    cd "${srcdir}/${pkgname%-git}"
    DESTDIR="${pkgdir}" cmake --install build
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
