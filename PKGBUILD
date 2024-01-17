# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server-git
pkgver=2.3.3.r187.g3c1d1f9
pkgrel=1
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL-3.0-or-later')
conflicts=(casparcg-server)
provides=(casparcg-server)
depends=(ffmpeg boost-libs libgl freeimage glew tbb openal sfml libxcomposite libxkbcommon libxss libcups pango nss at-spi2-atk ttf-liberation)
makedepends=(git cmake ninja boost dos2unix)
source=("casparcg-server::git+https://github.com/CasparCG/server.git"
        casparcg)
sha256sums=('SKIP'
            'ce9dd83ae2ef9289e551f0a3ecbe246537195049c15f69bbfdc6c3ddd23291c2')

pkgver() {
    cd "$srcdir/casparcg-server"
    git describe --long --abbrev=7 | sed 's/^v//;s/.lts//;s/.stable//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/casparcg-server"

    dos2unix src/shell/casparcg.config
}

build() {
    cd "$srcdir"
    cmake -B build -S "casparcg-server/src" \
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
