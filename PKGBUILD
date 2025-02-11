# Maintainer: Dheeraj Vittal Shenoy <dheerajshenoy22@gmail.com>

pkgname=navifm-git
pkgver=v1.3.3.r29.g98d6d84
pkgrel=1
pkgdesc="Highly customizable and extensible modern file manager"
arch=('x86_64')
url="https://github.com/dheerajshenoy/navifm"
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'poppler-qt6' 'libarchive' 'lua' 'imagemagick' 'gcc-libs' 'glibc' 'base-devel' 'ffmpegthumbnailer')
makedepends=('cmake' 'ninja' 'git' 'pkgconf' 'sccache' 'ccache')
provides=('navifm')
source=("${pkgname}-${pkgver}::git+$url")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
    cd "$pkgname-$pkgver"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname-$pkgver"

    # Ensure submodules are updated
    git submodule update --init --recursive

    # Create build directory
    mkdir -p build && cd build

    # Run CMake with Ninja
    cmake .. \
          -G Ninja \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release

    # Compile using all available cores
    ninja -j$(nproc)
}

package() {
    cd "$pkgname-$pkgver/build"

    # Install binary
    install -Dm755 "$srcdir/$pkgname-$pkgver/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install shared resources
    install -d "$pkgdir/usr/share/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/data/_lua/" "$pkgdir/usr/share/$pkgname/"

    # Install icons (if available)
    # install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    # install -Dm644 "$srcdir/$pkgname-$pkgver/resources/images/menu.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/navi.svg"

    # Install .desktop entry (if available)
    install -Dm644 "$srcdir/$pkgname-$pkgver/resources/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install man pages (if available)
    # install -d "$pkgdir/usr/share/man/man1"
    # if [[ -f "$srcdir/$pkgname/docs/navi.1" ]]; then
    #     install -Dm644 "$srcdir/$pkgname/docs/navi.1" "$pkgdir/usr/share/man/man1/navi.1"
    # fi
}
