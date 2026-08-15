pkgname=mailove-git
pkgver=2.5.r0.g4dc126e
pkgrel=1
pkgdesc="The fast KDE-only email client"
arch=('any')
url="https://github.com/nekromoff/mailove"
license=('LGPL-3.0')
makedepends=('git' 'cmake' 'make' 'vulkan-headers' 'svgo')
depends=(
  qt6-webengine
  qtkeychain-qt6
  kimap
  kmime
  ksmtp
  kcoreaddons
  qgpgme
  libglvnd
)
source=("git+https://github.com/nekromoff/mailove.git")
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --tags --long --always | sed -E 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  svgo . -r --multipass
}

build() {
    cd "$srcdir/${pkgname%-git}"

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-rtti -fno-exceptions \
            -fmerge-all-constants -ffunction-sections \
            -fdata-sections -fvisibility=hidden"

    BASE_CXXFLAGS="$BASE_CFLAGS"
    BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -flto -fno-plt"

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
    cd "$srcdir/${pkgname%-*}"

    DESTDIR="$pkgdir" cmake --install build
}
