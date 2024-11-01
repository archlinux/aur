# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server-git
pkgver=2.3.3.r250.g5b0716e
pkgrel=1
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL-3.0-or-later')
conflicts=(casparcg-server)
provides=(casparcg-server)
depends=(ffmpeg boost-libs libgl freeimage glew tbb openal sfml libxcomposite libxdamage libxkbcommon libxss libcups pango nss at-spi2-atk ttf-liberation)
makedepends=(git cmake ninja boost dos2unix)
source=("casparcg-server::git+https://github.com/CasparCG/server.git"
        casparcg)
sha256sums=('SKIP'
            '12a864689feb28c09fe809b733cfd502602dd8467bca83a617a3fec02fc92a66')

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

    # cef's build is incompatible with _FORTIFY_SOURCE=3
    export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

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
