pkgname=uncso2
pkgver=2.1.1
pkgrel=1
pkgdesc="Extract Counter-Strike: Online 2 and Titanfall Online game files"
arch=(any)
url="https://github.com/harmonytf/UnCSO2"
license=(GPL-3.0-only)
depends=(libuncso2)
makedepends=(cmake)
_commit=bfe8a91e33887ab5676a8f232b09a0a25f29d8b4
_dirname="$pkgname"
source=("$_dirname::git+$url.git#commit=$_commit")
sha256sums=("SKIP")

prepare() {
    cd "$_dirname"
    git submodule update --init --recursive
}

build() {
	cmake -B build -S "$_dirname" \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$_dirname/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"

    rm -rf "$pkgdir/usr/bin/cryptest"
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib/libcryptopp.a"
	rm -rf "$pkgdir/usr/share/cmake"
	rm -rf "$pkgdir/usr/share/cryptopp"
	rm -rf "$pkgdir/usr/share/pkgconfig/cryptopp.pc"

    # empty dirs
	rm -rf "$pkgdir/usr/share/pkgconfig"

	# those belong to libuncso2 package
	rm -rf "$pkgdir/usr/lib"
}
