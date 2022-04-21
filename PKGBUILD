# Maintainer: TNE <totallynotelite@gmail.com>

pkgname=garuda-downloader-git
pkgver=r36.d3eccf2
pkgrel=2
pkgdesc="Installation image downloader for Garuda Linux with support for delta downloads"
arch=('x86_64')
url="https://gitlab.com/garuda-linux/applications/garuda-downloader"
license=('GPL')
depends=('qt5-base')
makedepends=('qt5-tools' 'cmake' 'git')
provides=('garuda-downloader')
conflicts=('garuda-downloader')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    
    cd "$pkgname"
    install -Dm0644 resources/garuda.svg "$pkgdir/usr/share/pixmaps/garuda-downloader.svg"
    install -Dm0644 resources/Garuda-Downloader.desktop "$pkgdir/usr/share/applications/Garuda-Downloader.desktop"
}
