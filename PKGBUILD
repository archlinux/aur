# Maintainer: Alex Palaistras <alex+archlinux@deuill.org>

pkgbase=libfive-git
pkgname=('libfive-git' 'libfive-studio-git')
pkgver=rip.rdmc.719.g5050cc0b
pkgrel=1
arch=("i686" "x86_64")
license=("GPL2")
url="https://libfive.com"
makedepends=("git" "cmake" "pkg-config" "boost" "eigen")
source=("git+https://github.com/libfive/libfive.git" "libfive-studio.desktop")
sha256sums=("SKIP" "cc241ab16395381a8f259e3567e3840b471e6f309b2af8ef4b567f312b5ab3de")

_pkgname=libfive

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    mkdir -p "$srcdir/$_pkgname/build"
    cd "$srcdir/$_pkgname/build"
    cmake ..
    make
}

package_libfive-git() {
    pkgdesc="A software library and set of tools for solid modeling"
    depends=("boost-libs" "guile" "libpng")
    provides=("libfive")
    conflicts=("libfive")

    cd "$srcdir/$_pkgname/build"
    DESTDIR="$pkgdir" cmake -DCMAKE_INSTALL_PREFIX=/usr -P libfive/cmake_install.cmake
}

package_libfive-studio-git() {
    pkgdesc="A minimalist GUI for solid modeling with the libfive kernel"
    depends=("libfive-git" "qt5-base")
    provides=("libfive-studio")
    conflicts=("libfive-studio")

    cd "$srcdir/$_pkgname/build"
    DESTDIR="$pkgdir" cmake -DCMAKE_INSTALL_PREFIX=/usr -P studio/cmake_install.cmake

    # Rename Studio binary for uniqueness.
    mv "$pkgdir/usr/bin/Studio" "$pkgdir/usr/bin/libfive-studio"

    # Install additional support files.
    install -Dm644 "$srcdir/libfive-studio.desktop" "$pkgdir/usr/share/applications/libfive-studio.desktop"
 	install -Dm644 "$srcdir/$_pkgname/studio/deploy/icon/icon.svg" "$pkgdir/usr/share/pixmaps/libfive-studio.svg"
}