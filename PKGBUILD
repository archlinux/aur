# Maintainer: taotieren <admin@taotieren.com>

pkgname=c6
pkgver=0.6.5
pkgrel=1
pkgdesc="Self-hosting C compiler (c6c) with defer, modules, generics, async/await and managed refs; .c6 enables extensions"
arch=($CARCH)
url="https://github.com/c6lang/c6"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
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
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('c1d35dcdbead38e4c12c67514152a85e0deccf52060480627b069572e6f05fd7')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    cmake -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DC6_TCC_SHARED_LIBTCC=ON \
        -B build 
    cmake --build build --parallel
}

# check() {
#     cd "${srcdir}/${pkgname}"
#     ctest --test-dir build --output-on-failure
# }

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
