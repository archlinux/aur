# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server-git
pkgver=2.3.3.r68.gcf07ef6
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
        "https://cdn-fastly.obsproject.com/downloads/cef_binary_${_cef_version}_linux64.tar.bz2"
        casparcg)
sha256sums=('SKIP'
            '5c6f2a3007e3a8739bc1f3eaec3c694af9836aed1943217843a92acff80950c1'
            'e7f0e0dd123b1cccac21611f4e32ba7d27ce24a9a0587ef6f2180fb3c63894c0'
            '54aba14a7228bb8f2573e081d795b4161bf3568796f8729ad42a9f8ef9c6d1ec'
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
    # build libcef_dll_wrapper
    cd "$srcdir/cef_binary_${_cef_version}_linux64"

    # for some reason the CEF tarball includes a pre-created dir
    rm -r build
    cmake -B build -S . -DCMAKE_BUILD_TYPE=None -G Ninja

    ninja -C build
    cp build/libcef_dll_wrapper/libcef_dll_wrapper.a Release/

    cd "$srcdir"
    cmake -B build -S "casparcg-server/src" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCEF_ROOT_DIR="$srcdir/cef_binary_${_cef_version}_linux64" \
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
