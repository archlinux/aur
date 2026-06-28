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

    # Generate a tiny WAV sample for PGO
    ffmpeg -f lavfi -i "sine=frequency=1000:duration=1" -ac 2 -ar 44100 "$srcdir/sample.wav" -y

    # 1) PGO: profile-generate build
    make clean || true
    make -j"$(nproc)" \
        CFLAGS="-O3 -march=native -mtune=native \
                -funroll-loops -falign-functions=32 -falign-loops=32 \
                -fno-math-errno -fno-trapping-math \
                -fno-semantic-interposition -Wall -pipe \
                -fomit-frame-pointer -fno-plt \
                -fprofile-generate" \
        LDFLAGS="-fprofile-generate"

    # 2) PGO: generate profile by encoding sample audio
    ./builds/release/hmp3 "$srcdir/sample.wav" "$srcdir/sample.mp3"

    # 3) PGO: profile-use optimized build
    make clean || true
    make -j"$(nproc)" \
        CFLAGS="-O3 -march=native -mtune=native \
                -funroll-loops -falign-functions=32 -falign-loops=32 \
                -fno-math-errno -fno-trapping-math \
                -fno-semantic-interposition -Wall -pipe \
                -fomit-frame-pointer -fno-plt \
                -fprofile-use -fprofile-correction \
                -flto=thin" \
        LDFLAGS="-fprofile-use -fprofile-correction -flto=thin"
}

package() {
    cd "$srcdir/hmp3"

    # Install binary
    install -Dm755 builds/release/hmp3 "$pkgdir/usr/bin/hmp3"

    # Install license
    install -Dm644 hmp3/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
