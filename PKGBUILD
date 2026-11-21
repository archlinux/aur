# caelestia-lib

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-lib'
pkgver=0.0.2
pkgrel=1
pkgdesc='Shared C++ library for Caelestia'
arch=('x86_64' 'aarch64')
url='https://github.com/caelestia-dots/lib'
license=('GPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-declarative'
    'ffmpeg'
    'wayland'
)
optdepends=(
    'dart-sass: Discord theming'
    'dconf: GTK theming'
    'papirus-folders: folder icon theming'
    'gpu-screen-recorder: screen recorder'
)
makedepends=('git' 'cmake' 'ninja' 'qt6-wayland' 'wayland-protocols')
provides=($pkgname)
conflicts=($pkgname-git)
_pkg="${pkgname}-v${pkgver}"
source=("${url}/releases/download/v${pkgver}/${_pkg}.tar.gz")
sha256sums=('6695dc30995e77d49c1927e27004b2d980918b4a4d8fbd64fc53b64f982c0877')

build() {
    cd "${srcdir}/${_pkg}"

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVERSION=$pkgver \
        -DGIT_REVISION="$(cat REVISION)" \
        -DDISTRIBUTOR="AUR (package: ${pkgname})"
    cmake --build build
}

package() {
    cd "${srcdir}/${_pkg}"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
