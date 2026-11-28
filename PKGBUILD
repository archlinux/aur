# Maintainer: Adrian Grzeca <adrian@grzeca.me>

# Ragtime release, with voice (libsotto) and noise reduction (RNNoise).
#
# sotto and RNNoise come in as sources at the commits the release pins
# (packaging/sotto.sh, denoise/CMakeLists.txt): bump _sotto and _rnnoise
# together with _tag. prepare() checks they still match, and CMake
# downloads nothing itself.
#
# Layout: /usr/lib/ragtime/{ragtime,libsotto.so.0,libcodec2.so.*} plus a
# /usr/bin/ragtime link. Ragtime looks for libsotto beside its real path
# (/proc/self/exe), and the libcodec2 is sotto's own fork, not the codec2
# package, so it stays private to Ragtime.

pkgname=ragtime
_tag=v0.4.0-beta
_sotto=aa44cdb69e30fe5feb5666db3bde4ab3a5d1e031
_rnnoise=6cbfd53eb348a8d394e0757b4025c6ded34eb2b6
pkgver=0.4.0beta
pkgrel=1
pkgdesc='Chat and file transfer over HF with Data2G'
arch=(x86_64 aarch64)
url='https://github.com/baitisj/ragtime'
license=(MIT LGPL-2.1-or-later BSD-3-Clause)
depends=(glibc libgcc libstdc++ glib2 gtk3 hamlib libheif libpipewire libwebp openjpeg2 pango wxwidgets-common wxwidgets-gtk3)
makedepends=(cmake git ninja patchelf)
optdepends=('data2g: data2g-host, the modem Ragtime talks to (can also run on another machine)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
        "git+https://github.com/baitisj/sotto.git#commit=$_sotto"
        "git+https://github.com/xiph/rnnoise.git#commit=$_rnnoise")
sha256sums=('b93a2eb40aaa226b9c9798f04cca5be93051695966b96fb4f8bff6e78fe16679'
            SKIP
            SKIP)

_src=$pkgname-${_tag#v}

prepare() {
    local sotto rnn
    sotto=$(sed -n 's/^SOTTO_COMMIT=\([0-9a-f]*\).*/\1/p' $_src/packaging/sotto.sh)
    rnn=$(sed -n 's/.*GIT_TAG *\([0-9a-f]\{40\}\).*/\1/p' $_src/denoise/CMakeLists.txt)
    if [[ $sotto != "$_sotto" || $rnn != "$_rnnoise" ]]; then
        echo "Pins changed: sotto $sotto (have $_sotto), RNNoise $rnn (have $_rnnoise)" >&2
        return 1
    fi
}

build() {
    # libsotto and its libcodec2, with upstream's script, from our sotto checkout.
    SOTTO_SOURCE="$srcdir/sotto" SOTTO_WORK="$srcdir/sotto-build" \
        bash -e $_src/packaging/build-sotto.sh "$srcdir/sotto-out"

    cmake -S $_src -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DRAGTIME_TESTS=OFF \
        -DRAGTIME_WERROR=OFF \
        -DRAGTIME_BUILD_SOTTO=OFF \
        -DFETCHCONTENT_SOURCE_DIR_RNNOISE="$srcdir/rnnoise"
    cmake --build build
}

package() {
    local lib

    install -Dm755 build/app/ragtime "$pkgdir/usr/lib/ragtime/ragtime"
    install -dm755 "$pkgdir/usr/bin"
    ln -s ../lib/ragtime/ragtime "$pkgdir/usr/bin/ragtime"

    install -Dm755 sotto-out/libsotto.so.0 sotto-out/libcodec2.so.* -t "$pkgdir/usr/lib/ragtime"
    # build-sotto.sh leaves a RUNPATH into the codec2 build tree: point it
    # at the neighbouring file instead.
    patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/ragtime/libsotto.so.0"
    for lib in "$pkgdir"/usr/lib/ragtime/libcodec2.so.*; do
        patchelf --remove-rpath "$lib"
    done

    install -Dm644 $_src/packaging/linux/ragtime.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 $_src/app/res/ragtime.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 $_src/app/res/ragtime.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    install -Dm644 $_src/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 sotto-out/licences/sotto.txt sotto-out/licences/codec2.txt \
        -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 rnnoise/COPYING "$pkgdir/usr/share/licenses/$pkgname/rnnoise.txt"
    install -Dm644 $_src/README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
