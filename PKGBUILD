# Maintainer: taotieren <admin@taotieren.com>

pkgname=c6
pkgver=0.1.0
pkgrel=1
pkgdesc="c6 — TinyCC with language extensions"
arch=($CARCH)
url="https://github.com/c6lang/c6"
license=('LGPL-2.0-or-later')
provides=(${pkgname} tcc)
conflicts=(${pkgname} tcc)
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
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('975501877dffdb32e278ddd29af7d15ffd96827a99c862b027a5d8c2914b60c7')

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

check() {
    cd "${srcdir}/${pkgname}"
    ctest --test-dir build --output-on-failure
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
    install -vDm0644 tcc/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
