pkgname=eshot-git
pkgver=4.2.7.r0.g3b30f96
pkgrel=1
pkgdesc="Fast, lightweight Windows and Linux(KDE Plasma 6) screenshot tool with annotations, OCR, uploads, pinned captures, GIF recording, and MP4 screen recording (git version, patched to use system Qt theme)"
arch=('any')
url="https://github.com/Benoks/EShot"
license=('MIT')
makedepends=('cmake' 'make' 'pkgconf' 'vulkan-headers' 'svgo')
depends=('qt6-base' 'libsecret' 'ffmpeg' 'tesseract' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugin-pipewire' 'xdg-desktop-portal' 'desktop-file-utils' 'wireplumber') # based on ldd and https://github.com/Benoks/EShot/blob/main/LINUX_DEPENDENCY_SETUP.md
source=("git+https://github.com/Benoks/EShot.git" "system_theme.patch")
sha256sums=('SKIP' 'bd9fa1187c3f8dbe090464e994a8ce0cc90013bd0a7d442594a432d7fefa4b4b')

pkgver() {
  cd EShot
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd EShot && pwd
    svgo . -r --multipass
    patch -Np1 -i "$srcdir/system_theme.patch"
}

build() {
    cd EShot

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-exceptions \
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

    cmake -S . -B build -DBUILD_TESTING=OFF
    cmake --build build --parallel $(nproc)
}

package() {
    cd "$srcdir/EShot"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
