# Maintainer: Hamza Abdelmoumene <250554870+hamza-abdelmoumene@users.noreply.github.com>
pkgname=vespera-git
_pkgname=vespera
pkgver=0.1.0
pkgrel=1
pkgdesc="Standalone music player companion: MPRIS control, synced lyrics, visualizer and equalizer (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/hamza-abdelmoumene/vespera"
license=('MIT')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'git')
optdepends=('cava: audio visualizer'
            'easyeffects: 10-band equalizer')
provides=('vespera')
conflicts=('vespera')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S "$_pkgname" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
