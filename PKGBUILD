# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>
pkgname=chatgpt-desktop-unix-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Unofficial ChatGPT desktop app for Linux and BSD (Qt6, QtWebEngine)"
arch=('x86_64')
url="https://github.com/KuznixTeam/chatgpt-desktop-unix"
license=('GPL3')
depends=('qt6-base' 'qt6-webengine' 'cmake' 'gcc' 'make')
makedepends=('git')
source=("$pkgname::git+$url"
        "chatgpt-desktop-unix.desktop"
        "app.png")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    local commitnum=$(git rev-list --count HEAD)
    local commitsha=$(git rev-parse --short HEAD)
    echo "0.0.1.r${commitnum}.${commitsha}"
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir" install

    # Install the .desktop file
    install -Dm644 "$srcdir/chatgpt-desktop-unix.desktop" "$pkgdir/usr/share/applications/chatgpt-desktop-unix.desktop"

    # Install the app icon
    install -Dm644 "$srcdir/app.png" "$pkgdir/usr/share/pixmaps/app.png"
}
