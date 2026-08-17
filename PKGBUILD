# Maintainer: dim <mlrudasill@gmail.com>

pkgname='astramarket-git'
pkgver=1.0.1.r0.g4938424
pkgrel=1
pkgdesc='Unified Linux marketplace with Flatpak, Pacman, AUR, and AppImage support (git master)'
arch=('x86_64')
url='https://github.com/dim-ghub/AstraMarket'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools' 'qt6-svg')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'qt6-shadertools')
optdepends=('flatpak: Flatpak package support'
            'paru: AUR package support'
            'yay: AUR package support'
            'pacman: Pacman package support')
provides=('astramarket' 'astra')
conflicts=('astramarket' 'astramarket-bin')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/AstraMarket"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf "1.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/AstraMarket"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/AstraMarket"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
