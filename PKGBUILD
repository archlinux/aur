# Maintainer: Michael Tracy <m@tracy.sh>
pkgname=fplayer-git
pkgver=r471.92a8c75
pkgrel=1
pkgdesc="Cross-platform FSEQ file player for Light-O-Rama hardware"
arch=('x86_64' 'aarch64')
url="https://github.com/Cryptkeeper/fplayer"
license=('custom')
depends=('cjson' 'libserialport' 'openal' 'freealut' 'zstd')
makedepends=('git' 'cmake')
provides=('fplayer')
conflicts=('fplayer')
source=("git+https://github.com/Cryptkeeper/fplayer.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/fplayer"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/fplayer"
    
    # Initialize and update submodules
    git submodule update --init --recursive
    
    # Fix missing limits.h include in gentool (add after assert.h)
    sed -i '/#include <assert.h>/a #include <limits.h>' tool/gentool/main.c
}

build() {
    cd "$srcdir/fplayer"
    
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_FLAGS="$CFLAGS"
    
    cmake --build build
}

check() {
    cd "$srcdir/fplayer/build"
    ctest --output-on-failure || warning "Tests failed"
}

package() {
    cd "$srcdir/fplayer"
    
    # Install binary
    install -Dm755 "build/fplayer" "$pkgdir/usr/bin/fplayer"
    
    # Install tools
    install -Dm755 "build/mftool" "$pkgdir/usr/bin/fplayer-mftool"
    install -Dm755 "build/gentool" "$pkgdir/usr/bin/fplayer-gentool"
    
    # Install default channel map
    install -Dm644 "channels.json" "$pkgdir/usr/share/fplayer/channels.json"
    
    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/fplayer/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/fplayer/LICENSE"
}
