# Maintainer: Christian Schendel (doppelhelix@gmail.com)
pkgname=mediaelch-git
pkgver=2.12.0.r32.g5bff30e8
pkgrel=1
pkgdesc='MediaElch is a MediaManager for Kodi'
url='https://github.com/Komet/MediaElch'
arch=(
    x86_64
)
license=(
    LGPL-3.0-or-later
)

depends=(
    glibc
    gcc-libs
    libmediainfo
    qt6-declarative
    qt6-multimedia
    qt6-svg
    quazip-qt6
)
makedepends=(
    cmake
    git
    ninja
    qt6-tools
)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local cmake_options=(
        -S "$srcdir/${pkgname%-git}"
        -B build
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_BUILD_TYPE=None
        -DDISABLE_UPDATER=ON
        -DUSE_EXTERN_QUAZIP=ON
        -DMEDIAELCH_FORCE_QT5=OFF
        -DMEDIAELCH_FORCE_QT6=ON
        -Wno-dev
        -G Ninja
    )
    cmake "${cmake_options[@]}"
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
    cd "$srcdir/${pkgname%-git}"
    install -Dm0644 -t "$pkgdir/usr/share/doc/${pkgname%-git}" README.md CONTRIBUTING.md CHANGELOG.md
}

# vim: set ts=4 sw=4 et:
