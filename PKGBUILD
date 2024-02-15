# Maintainer: detiam <dehe_tian@outlook.com>

# shellcheck disable=SC1090
pkgname=lightlyshaders
pkgver='2.2.1'
pkgrel='1'
pkgdesc="Rounded window corners and outline effect for KWin."
arch=(x86_64)
url="https://github.com/a-parhom/${pkgname}"
license=(GPL-2.0-or-later)
depends=(kio5 knotifications5 kinit kwin kcrash5 kglobalaccel5 qt5-x11extras)
makedepends=(base-devel extra-cmake-modules qt5-tools ninja)
provides=("${pkgname}-qt5=${pkgver}")
conflicts=("${provides[@]}")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

function prepare {
    # links to libkwin.so.5, fix build
    . <(sed -n '/^LIBKWIN_.*=.*/p' "${pkgname}/install.sh")
    sed -i "/^target_link_libraries(/,/)$/ s| kwin$| $LIBKWIN_PATH|" "${pkgname}/src/blur/CMakeLists.txt"
}

function build {
    cmake -S "${pkgname}" -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr"
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" PREFIX=/usr ninja -C build install
}