# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server
pkgver=2.4.0
_pkgver=$pkgver-stable
pkgrel=1
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL-3.0-or-later')
depends=(ffmpeg boost-libs libgl freeimage glew tbb openal sfml libxcomposite libxdamage libxkbcommon libxss libcups pango nss at-spi2-atk ttf-liberation)
makedepends=(cmake ninja boost dos2unix git)
source=("https://github.com/CasparCG/server/archive/refs/tags/v$_pkgver.tar.gz"
        casparcg)
sha256sums=('2d90cf1993bd84389f8403166cbab5825011f7c1f31bd6bbf141778e31effa49'
            'ce9dd83ae2ef9289e551f0a3ecbe246537195049c15f69bbfdc6c3ddd23291c2')

prepare() {
    cd "$srcdir/server-$_pkgver"

    dos2unix src/shell/casparcg.config
}

build() {
    cd "$srcdir"

    # cef's build is incompatible with _FORTIFY_SOURCE=3
    export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

    cmake -B build -S "server-$_pkgver/src" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_SYSTEM_FFMPEG=ON \
        -DDIAG_FONT_PATH="/usr/share/fonts/liberation/LiberationMono-Regular.ttf" \
        -G Ninja

    ninja -C build
}

package() {
    install -d "$pkgdir/opt/casparcg/"
    cp -r "$srcdir/build/staging"/{bin,lib,casparcg.config} "$pkgdir/opt/casparcg/"

    install -Dm755 "$srcdir/casparcg" "$pkgdir/usr/bin/casparcg"
}
