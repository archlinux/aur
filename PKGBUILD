# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=invader-git
pkgver=0.49.1.r3899.c8d8aaa9
pkgrel=1
pkgdesc="An open source toolkit for creating maps and assets for Halo: Combat Evolved (git build)"
depends=('libtiff' 'libarchive' 'libsquish' 'flac' 'freetype2' 'libsamplerate'
         'libvorbis' 'qt6-base' 'sdl2' 'zlib')
makedepends=('cmake' 'corrosion' 'git' 'ninja' 'python' 'rust')
arch=('x86_64')
url="https://invader.opencarnage.net"
license=('GPL3')
source=("git+https://github.com/SnowyMouse/${pkgname%-git}.git"
        "git+https://github.com/SnowyMouse/hiat.git")
sha256sums=('SKIP'
            'SKIP')
provides=('invader')
conflicts=('invader')

pkgver() {
    cd "$srcdir"/${pkgname%-git}
    printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
    cd invader
    git submodule init
    git config submodule.hiat.url "$srcdir/hiat"
    git submodule update
}

build() {
    cd "$srcdir"/build
    cmake ../${pkgname%-git} -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    ninja
}

package() {
    cd "$srcdir"/build
    ninja install

    # Workaround this being missing for now…
    install -Dm644 libhiatc.so ${pkgdir}/usr/lib/libhiatc.so
}
