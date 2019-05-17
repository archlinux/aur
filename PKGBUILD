# Maintainer: Afnan Enayet <afnan at afnan dot io>
pkgname='autotidy-git'
_pkgname='autotidy'
pkgver='43.d77d67b'
pkgrel='1'
pkgdesc="Speedier handling of clang-tidy checking"
provides=('autotidy')
depends=('yaml-cpp' 'fmt' 'cli11')
makedepends=('cmake' 'git')
arch=('any')
sha256sums=('SKIP'
            'SKIP'
            '930244a70099ebf81174c88114fd9aa67b6807e2149dcab221c0653d262d51f2')
url='https://github.com/sasq64/autotidy'
license=('MIT')
source=('git+https://github.com/sasq64/autotidy.git'
        'git+https://github.com/abseil/abseil-cpp.git'
        'cmake.patch')

pkgver() {
    cd ${_pkgname}
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}
    patch --forward --strip=1 --input="${srcdir}/cmake.patch"
    git submodule init
    git config submodule.abseil-cpp.url $srcdir/abseil-cpp
    git submodule update external/abseil-cpp
}

build() {
    cd ${_pkgname}
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make -j$(nproc)
}

package() {
    mkdir -p $pkgdir/usr/bin
    cd ${_pkgname}
    ls
    cp build/autotidy $pkgdir/usr/bin
}
