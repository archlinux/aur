pkgname=hmp3-git
pkgver=7f7dfc7
pkgrel=1
pkgdesc="Helix MP3 encoder"
arch=('x86_64')
url="https://github.com/maikmerten/hmp3"
license=('RCSL')
depends=()
makedepends=('git' 'make')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/hmp3"
    git describe --always | sed 's/^v//; s/-/./g'
}

build() {
    cd "$srcdir/hmp3"

    make -j"$(nproc)" \
        CFLAGS="-O3 -march=native -mtune=native \
                -funroll-loops -falign-functions=32 -falign-loops=32 \
                -fno-math-errno -fno-trapping-math \
                -fno-semantic-interposition -Wall -pipe \
                -fomit-frame-pointer -fno-plt -flto" \
        CXXFLAGS="-O3 -march=native -mtune=native \
                  -funroll-loops -falign-functions=32 -falign-loops=32 \
                  -fno-math-errno -fno-trapping-math \
                  -fno-semantic-interposition -Wall -pipe \
                  -fomit-frame-pointer -fno-plt -flto" \
        LDFLAGS="-fno-plt -flto"
}

package() {
    cd "$srcdir/hmp3"

    # Install binary
    install -Dm755 builds/release/hmp3 "$pkgdir/usr/bin/hmp3"

    # Install license
    install -Dm644 hmp3/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
