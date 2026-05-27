pkgname=ausweisapp-git
_pkgname=AusweisApp
pkgver=2.5.1.r87.g9bca2502
pkgrel=1
pkgdesc="Der offizielle eID-Client des Bundes für den Online-Ausweis"
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
    'ccid: Unterstützt dedizierte USB-Kartenleser'
)
provides=('ausweisapp')
conflicts=('ausweisapp')
# Der Zusatz "ausweisapp::" sorgt dafür, dass der Klon-Ordner kleingeschrieben wird
source=("ausweisapp::git+https://github.com/Governikus/AusweisApp.git")
sha256sums=('SKIP')

pkgver() {
    cd ausweisapp

    # Holt das letzte offizielle Release-Tag und hängt den Commit-Count an
    # Falls keine Tags gefunden werden, fällt es auf ein reines Commit-Format zurück
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd ausweisapp

    # Erstellt einen sauberen Build-Ordner außerhalb des Quellcodes (Best Practice)
    mkdir -p build
}

build() {
    # Wir nutzen hier die Standard-Arch-Flags, indem wir cmake wie gewohnt füttern
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
