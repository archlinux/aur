# Maintainer: kekmacska

pkgname=unisic-git
pkgver=0.8.4.r15.ga01aeb2
pkgrel=1
pkgdesc='Screenshot & screen-recorder for Linux'
arch=('any')
license=('GPL-3.0-only')
url='https://unisic.app/'
source=('git+https://github.com/unisic/unisic.git')
makedepends=(cmake make svgo pkgconf plasma-wayland-protocols)
depends=(qt6-base qt6-declarative qt6-svg qt6-wayland ffmpeg wl-clipboard xdg-desktop-portal)
optdepends=('libx11: for X11'
            'libxext: for X11'
            'libxfixes: for X11'
            'libxcb: for X11'
            'curl: FTP/SFTP upload destinations'
            'xdg-desktop-portal-kde: KDE portal backend for screenshots and screen recording'
            'xdg-desktop-portal-gtk: generic portal backend on non-KDE desktops'
            'tesseract-data-osd: OCR language data'
            'pipewire'
            'kguiaddons') #according to https://github.com/unisic/unisic/blob/main/CONTRIBUTING.md#building
provides=(unisic)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "$srcdir/${pkgname%-*}"
    git submodule update --init --recursive

    svgo . -r --multipass
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

package(){
    cd "$srcdir/${pkgname%-*}"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
