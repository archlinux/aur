# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server-git
pkgver=2.3.3.r186.gfb253fd
pkgrel=2
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL3')
conflicts=(casparcg-server)
provides=(casparcg-server)
depends=(ffmpeg boost-libs libgl freeimage glew tbb openal sfml libxcomposite libxkbcommon libxss libcups pango nss at-spi2-atk ttf-liberation)
makedepends=(git cmake ninja boost dos2unix)
source=("casparcg-server::git+https://github.com/CasparCG/server.git"
        "https://github.com/CasparCG/server/commit/9ee50d528de054a105bea9b0de692ce99e322573.patch"
        casparcg)
sha256sums=('SKIP'
            '59fa9c8f653c1aa787feb611eae4440c602416e52645ea4ff048518424d4aa82'
            'ce9dd83ae2ef9289e551f0a3ecbe246537195049c15f69bbfdc6c3ddd23291c2')

pkgver() {
    cd "$srcdir/casparcg-server"
    git describe --long --abbrev=7 | sed 's/^v//;s/.lts//;s/.stable//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/casparcg-server"

    for f in ../*.patch
    do
        patch --forward --strip=1 --input "$f"
    done

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
