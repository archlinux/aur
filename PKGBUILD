# Maintainer: Florian De Temmerman <floriandetemmerman@gmail.com>
pkgname=torrenttools
pkgver=v0.4.1
pkgrel=1
pkgdesc="Commandline tool for inspecting, creating and editing BitTorrent metafiles."
arch=('x86_64' 'aarch64')
url="https://github.com/fbdtemme/torrenttools"
license=("MIT")
groups=()
depends=("openssl")
makedepends=("cmake" "make" "git" "nasm" "autoconf" "automake" "m4")
optdepends=()
provides=("torrenttools")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/fbdtemme/torrenttools.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p cmake-build
    cmake -S "$srcdir/$pkgname" -B "cmake-build" \
        -DCMAKE_BUILD_TYPE="None" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DTORRENTTOOLS_BUILD_TESTS=OFF \
        -DTORRENTTOOLS_BUILD_DOCS=OFF \
        -DDOTTORRENT_CRYPTO_LIB=openssl \
        -DDOTTORRENT_MB_CRYPTO_LIB=isal

    cd cmake-build
    make torrenttools
}

package() {
    cmake --install "$srcdir/cmake-build" --component torrenttools --prefix "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin/"
    mv "$pkgdir/bin/torrenttools" "$pkgdir/usr/bin/torrenttools"
    rmdir "$pkgdir/bin/"
}