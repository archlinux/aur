pkgname=ausweisapp-git
_pkgname=AusweisApp
pkgver=2.5.1.r87.g9bca2502
pkgrel=1
pkgdesc="The official eID client of the German Federal Government for the online ID card"
arch=('x86_64' 'aarch64')
url="https://www.ausweisapp.bund.de/"
license=('EUPL-1.2')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-websockets'
    'qt6-scxml'
    'openssl'
    'pcsclite'
    'hicolor-icon-theme'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'qt6-tools'
    'vulkan-headers'
)
optdepends=(
    'ccid: Support for dedicated USB devices'
)
provides=('ausweisapp')
conflicts=('ausweisapp')
source=("ausweisapp::git+https://github.com/Governikus/AusweisApp.git")
sha256sums=('SKIP')

pkgver() {
    cd ausweisapp

    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd ausweisapp

    mkdir -p build
}

build() {
    cmake -B ausweisapp/build -S ausweisapp \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF

    cmake --build ausweisapp/build
}

package() {
    DESTDIR="$pkgdir" cmake --install ausweisapp/build
}
