# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=custom-toolbox
pkgver=26.03
pkgrel=1
pkgdesc="A customizable toolbox application built with Qt"
arch=('x86_64')
url="https://github.com/MX-Linux/custom-toolbox"
license=('GPL3')
depends=('qt6-base')
provides=('custom-toolbox')
conflicts=('custom-toolbox')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/custom-toolbox/archive/refs/tags/26.03.tar.gz")
sha256sums=('8b4a46643f524df4531f2c5416f2df0119a6c314f0dd3f81b16cba2b567db3a6')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Get version from pkgver (strip any extra pkgver info for CMake)
    _version="${pkgver}"

    # Configure with CMake, passing version override
    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="$_version"

    # Build
    cmake --build build --parallel
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install binary
    install -Dm755 build/custom-toolbox "${pkgdir}/usr/bin/custom-toolbox"

    # Install translations
    install -dm755 "${pkgdir}/usr/share/custom-toolbox/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/custom-toolbox/locale/" 2>/dev/null || true

    # Install config files
    install -dm755 "${pkgdir}/etc/custom-toolbox"
    install -Dm644 custom-toolbox.conf "${pkgdir}/etc/custom-toolbox/custom-toolbox.conf"
    install -Dm644 example.list "${pkgdir}/etc/custom-toolbox/example.list"

    # Install desktop file
    install -Dm644 custom-toolbox.desktop "${pkgdir}/usr/share/applications/custom-toolbox.desktop"

    # Install icons
    install -Dm644 icons/custom-toolbox.svg "${pkgdir}/usr/share/pixmaps/custom-toolbox.svg"
    install -Dm644 icons/custom-toolbox.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/custom-toolbox.svg"

    # Install documentation
    install -dm755 "${pkgdir}/usr/share/doc/custom-toolbox"
    if [ -d help ]; then
        cp -r help/ "${pkgdir}/usr/share/doc/custom-toolbox/" 2>/dev/null || true
    fi

    # Install changelog
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/custom-toolbox/changelog.gz"
}
