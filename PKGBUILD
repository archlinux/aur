pkgname=openscp-git
pkgver=1.0.0.r0.g9b39e51
pkgrel=1
pkgdesc="A lightweight, cross-platform file transfer client with a dual-panel workflow, secure defaults, and support for SFTP, SCP, FTP, FTPS, and WebDAV"
arch=('any')
url="https://github.com/luiscuellar31/openscp"
license=('LGPL-3.0')
makedepends=('git' 'cmake' 'make' 'svgo' 'oxipng')
depends=(
    openssl
    curl
    tinyxml2
    libssh2
    libsecret
    glib2
    libglvnd
    qt6-base
    qt6-svg
)
source=("git+$url.git")
sha256sums=('SKIP')


pkgver() {
    cd "${pkgname%-*}"
    git describe --tags --long --always | sed -E 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
  cd "${pkgname%-*}"
  svgo . -r --multipass
  oxipng -o max -r -p -s -v -t "$(nproc)" -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 assets/{linux,icons}
}

build() {
    cd "${pkgname%-*}"

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-rtti \
            -fmerge-all-constants -ffunction-sections \
            -fdata-sections -fvisibility=hidden"

    BASE_CXXFLAGS="$BASE_CFLAGS"
    BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

    # Clang-only flags
    CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
    CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
    CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

    # Detect compiler
    if command -v clang >/dev/null 2>&1; then
        export CC=clang
        export CXX=clang++
        export CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS $CLANG_EXTRA_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
    else
        export CC=gcc
        export CXX=g++
        export CFLAGS="$BASE_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS"
    fi

    cmake -B build -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_MANDIR=share/man \
        -DCMAKE_INSTALL_DATAROOTDIR=share \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_BINDIR=bin

    cmake --build build --parallel "$(nproc)"
}

package() {
    cd "${pkgname%-*}"

    DESTDIR="$pkgdir" cmake --install build
}
