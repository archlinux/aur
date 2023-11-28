# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server-git
pkgver=2.3.3.r151.g9212c29
_cef_version=4638
pkgrel=1
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL3')
conflicts=(casparcg-server)
provides=(casparcg-server)
depends=(ffmpeg boost-libs libgl freeimage glew tbb openal sfml libxcomposite libxkbcommon libxss libcups pango nss at-spi2-atk ttf-liberation)
makedepends=(git cmake ninja boost dos2unix)
source=("casparcg-server::git+https://github.com/CasparCG/server.git"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1308.patch"
        "ffmpeg-cmake.patch"
        casparcg)
sha256sums=('SKIP'
            '5c6f2a3007e3a8739bc1f3eaec3c694af9836aed1943217843a92acff80950c1'
            'e7f0e0dd123b1cccac21611f4e32ba7d27ce24a9a0587ef6f2180fb3c63894c0'
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
        -DUSE_SYSTEM_BOOST=ON \
        -G Ninja

    ninja -C build
}

package() {
    install -d "$pkgdir/opt/casparcg/"
    cp -r "$srcdir/build/staging"/{bin,lib,casparcg.config} "$pkgdir/opt/casparcg/"

    install -Dm755 "$srcdir/casparcg" "$pkgdir/usr/bin/casparcg"

    ln -sf "/usr/share/fonts/liberation/LiberationMono-Regular.ttf" "$pkgdir/opt/casparcg/"
}
