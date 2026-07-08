# Maintainer: shipa-2 <aurahag2@gmail.com>
pkgname=opensource-communicator-git
_pkgname=opensource-communicator
pkgver=0.1.0.r21.gefcde3a
pkgrel=1
pkgdesc="Open-source ITooLabs/Megafon PBX compatible VoIP & IM client (Qt6)"
arch=('x86_64')
url="https://github.com/shipa-2/Opensource-Communicator"
license=('custom')
depends=('qt6-base' 'qt6-websockets' 'qt6-multimedia' 'libdatachannel' 'opus' 'openssl' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/shipa-2/Opensource-Communicator.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    local tag count hash
    hash=$(git rev-parse --short=7 HEAD)
    count=$(git rev-list --count HEAD)
    printf "0.1.0.r%s.g%s" "$count" "$hash"
}

build() {
    cmake -S "$srcdir/$_pkgname/client" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # The bundled .desktop hardcodes the /opt path used by the portable build;
    # rewrite it for the /usr system install.
    sed -i \
        -e 's|^Exec=.*|Exec=opensource-communicator|' \
        "$pkgdir/usr/share/applications/opensource-communicator.desktop"
}
