# Maintainer: Viktor Schneider <info[at]vjs[dot]io>
pkgname=skyr-url-git
_commit=82f9560
pkgver=1.$_commit
pkgrel=1
pkgdesc="A C++ library that implements the URL WhatWG specification"
arch=('i686' 'x86_64')
url="https://github.com/glynos/url"
license=('Boost')
depends=("tl-expected")
makedepends=('cmake>=3.8.0' 'catch2' 'git')
source=("git+https://github.com/glynos/url.git")
md5sums=("SKIP")

prepare() {
    cd "url"
    git checkout $_commit
    # patch catch.hpp path to catch2/catch.hpp
    find -type f -exec sed -i 's/<catch.hpp>/<catch2\/catch.hpp>/g' {} \;
}

build() {
    cd "url"
    mkdir -p build
    cd build
    cmake -DCMAKE_CXX_FLAGS="-Werror=maybe-uninitialized" -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

check() {
    cd "url/build"
    ctest
}

package() {
    cd "url/build"
    make DESTDIR="$pkgdir/" install
}
