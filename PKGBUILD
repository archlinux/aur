# Maintainer: gimgiwer <gimgiwer@gmail.com>
pkgname=swiftify-git
pkgver=0.24.5.r0.g9a4f259
pkgrel=1
pkgdesc="A Spotify player for Wayland, in Material 3 after end4 (git master)"
arch=('x86_64' 'aarch64')
url="https://github.com/swiftify-org/swiftify"
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'hicolor-icon-theme'
    'libpulse'
    'openssl'
    'qcoro'
    'qt6-base'
    'qt6-declarative'
    'qt6-wayland'
    'qt6-websockets'
    'qtkeychain-qt6'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
    'qt6-shadertools'
    'rust'
)
optdepends=(
    'ttf-material-symbols-variable-git: icon font, if not bundled'
    'xdg-desktop-portal: native file picker for cover photos'
)
provides=('swiftify')
conflicts=('swiftify')
options=('!lto')
source=("${pkgname}::git+https://github.com/swiftify-org/swiftify.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -B build -S "${pkgname}" -G Ninja         -DCMAKE_BUILD_TYPE=Release         -DCMAKE_INSTALL_PREFIX=/usr         -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
