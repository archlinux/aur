# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=proton-mail-export
pkgver=1.0.5
pkgrel=1
pkgdesc='Allows to export emails as eml files'
arch=('x86_64')
url='https://proton.me/support/proton-mail-export-tool'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'clang' 'go' 'zip' 'unzip')
options=('!debug')
source=("git+https://github.com/ProtonMail/${pkgname}.git#tag=v${pkgver}")
sha256sums=('253e4ec4e037d824074200a101ffef6bd76b1ac8dcfcb30e9d7b2171772dda84')

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
    # see https://github.com/ProtonMail/proton-mail-export/issues/4
    sed 's/^\s*execPath = etcpp::getExecutableDir();$/execPath = std::filesystem::current_path();/g' -i cli/bin/main.cpp
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -d -m 755 "$pkgdir/usr/lib"
    mv "$pkgdir"/usr/bin/*.so "$pkgdir/usr/lib"
    rm -rf "$pkgdir/usr/meta"
}
