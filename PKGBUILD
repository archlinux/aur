# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server
pkgver=2.4.1
_pkgver=$pkgver-stable
pkgrel=1
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL-3.0-or-later')
depends=(ffmpeg boost-libs libgl freeimage glew tbb openal sfml libxcomposite libxdamage libxkbcommon libxss libcups pango nss at-spi2-atk ttf-liberation)
makedepends=(cmake ninja boost dos2unix git)
source=("https://github.com/CasparCG/server/archive/refs/tags/v$_pkgver.tar.gz"
        boost-1.85.patch
        boost-1.86.patch
        casparcg)
sha256sums=('4150888182a9e0a7364814eec49ad9a0f826850528a83f423f83fb02daca0af9'
            'be988b8640daaffecc589b222d451389630716c47f3aff4b63cfe6982f66e354'
            '874c3e4e060e8593e483c8de4401bf042105cbf5d134c7a12fe6c0e07abdfe3a'
            '12a864689feb28c09fe809b733cfd502602dd8467bca83a617a3fec02fc92a66')

prepare() {
    cd "$srcdir/server-$_pkgver"

    for f in ../*.patch
    do
        patch --forward --strip=1 --input "$f"
    done

    dos2unix src/shell/casparcg.config
}

build() {
    cd "$srcdir"

    export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

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
