# Maintainer: Ethan Alexander <ethanjalexander@hotmail.ca>

pkgname="wallpiper-kde"
pkgver=2.0.1
pkgrel=1
pkgdesc="KDE Plasma 6 portal for wallpiper"
arch=('x86_64')
url="https://github.com/shdwmtr/wallpiper"
license=('MIT')
depends=('wallpiper' 'qt6-base' 'qt6-declarative' 'mesa' 'libx11' 'libxrandr')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'qt6-base' 'qt6-declarative' 'mesa' 'libx11' 'libxrandr')
install="wallpiper-kde.install"
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"

    cmake -S programs/wallpiper-portal-kde/native -B build/kde \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build/kde --parallel
}

package() {
    cd "$srcdir/$pkgname"

    DESTDIR="$pkgdir" cmake --install build/kde

    local plasmadir="$pkgdir/usr/share/plasma/wallpapers/dev.wallpiper.kde"
    install -d "$plasmadir"
    cp -r programs/wallpiper-portal-kde/extension/. "$plasmadir/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
