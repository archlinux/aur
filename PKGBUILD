# Maintainer: Alex Palaistras <alex+archlinux@deuill.org>

pkgbase=libfive-git
pkgname=('libfive-git' 'libfive-studio-git')
pkgver=rip.dmc.r2166.g248c15c
pkgrel=1
arch=("i686" "x86_64")
url="https://libfive.com"
license=("GPL2")
makedepends=("git" "cmake" "boost" "eigen" "pkgconf")
source=("git+https://github.com/libfive/libfive.git#commit=248c15c57abd2b1b9ea0e05d0a40f579d225f00f"
        "libfive-studio.desktop")
sha256sums=('SKIP'
            'c0abfad437a3e658f1f81981ee5c79df2573440833a611b3e07de8b3f5c3b732')

_pkgname=libfive

pkgver() {
    # https://wiki.archlinux.org/title/VCS_package_guidelines#Git
    git -C "$srcdir/$_pkgname" describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -S "$srcdir/$_pkgname" \
        -B "$srcdir/$_pkgname/build"

    make -C "$srcdir/$_pkgname/build"
}

package_libfive-git() {
    pkgdesc="A software library and set of tools for solid modeling"
    depends=("libpng" "python")
    provides=("libfive")
    conflicts=("libfive")
    options=("!strip")

    DESTDIR="$pkgdir" cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -P "$srcdir/$_pkgname/build/libfive/cmake_install.cmake"
}

package_libfive-studio-git() {
    pkgdesc="A minimalist GUI for solid modeling with the libfive kernel"
    depends=("libfive-git" "qt5-base" "python" "guile")
    provides=("libfive-studio")
    conflicts=("libfive-studio")

    DESTDIR="$pkgdir" cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -P "$srcdir/$_pkgname/build/studio/cmake_install.cmake"

    # Rename Studio binary for uniqueness.
    mv "$pkgdir/usr/bin/Studio" "$pkgdir/usr/bin/libfive-studio"

    # Install additional support files.
    install -Dm644 "$srcdir/libfive-studio.desktop" "$pkgdir/usr/share/applications/libfive-studio.desktop"
 	install -Dm644 "$srcdir/$_pkgname/studio/deploy/icon/icon.svg" "$pkgdir/usr/share/pixmaps/libfive-studio.svg"
}
