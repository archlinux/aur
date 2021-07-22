# Maintainer Paweł Wegner <echo bGVtb3VyaW5AZ21haWwuY29tCg== | base64 -d>

pkgname=coro-cloudstorage-fuse
pkgver=1.0
pkgrel=1
pkgdesc="Cloud Storage FUSE mount"
url="https://github.com/lemourin/${pkgname}"
license=('custom')
_commit="341a23323d23e74b54319e55747dab93f64ed9f8"
_git=${url}
arch=('x86_64')
makedepends=(
   cmake
   ninja
   clang
   git
   pkg-config
   make
)
depends=(
   ffmpeg
   fmt
   crypto++
   fuse3
   curl
   libevent
   pugixml
   nlohmann-json
)

prepare() {
    cd $srcdir/
    rm -rf "${pkgname}"
    git clone "${_git}" "${pkgname}"
    cd "${pkgname}"
    git submodule update --init contrib/coro-cloudstorage
    cd contrib/coro-cloudstorage
    git submodule update --init contrib/coro-http
}

build() {
    cd $srcdir/
    cmake -G Ninja -B build -S "${pkgname}" \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -Wno-dev
    cmake --build build
}

package() {
    cd $srcdir/
    DESTDIR=${pkgdir}/ cmake --install build
}

#vim: syntax=sh
