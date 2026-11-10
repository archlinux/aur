# Maintainer: Adrian Grzeca <adrian@grzeca.me>

# Ragtime from main, with voice (libsotto) and noise reduction (RNNoise).
#
# sotto and RNNoise come in as sources; their commits are read from the pins
# in the checkout (packaging/sotto.sh, denoise/CMakeLists.txt), so they track
# upstream and CMake downloads nothing itself.
#
# Layout: /usr/lib/ragtime/{ragtime,libsotto.so.0,libcodec2.so.*} plus a
# /usr/bin/ragtime link. Ragtime looks for libsotto beside its real path
# (/proc/self/exe), and the libcodec2 is sotto's own fork, not the codec2
# package, so it stays private to Ragtime.

pkgname=ragtime-git
_name=ragtime
pkgver=0.2.0beta.r137.g6b898d9
pkgrel=1
pkgdesc='Chat and file transfer over HF with Data2G (git main)'
arch=(x86_64 aarch64)
url='https://github.com/baitisj/ragtime'
license=(MIT LGPL-2.1-or-later BSD-3-Clause)
depends=(glibc libgcc libstdc++ glib2 gtk3 hamlib libheif libpipewire libwebp openjpeg2 pango wxwidgets-common wxwidgets-gtk3)
makedepends=(cmake git ninja patchelf)
optdepends=('data2g: data2g-host, the modem Ragtime talks to (can also run on another machine)')
provides=(ragtime)
conflicts=(ragtime)
source=("$_name::git+$url.git"
        git+https://github.com/baitisj/sotto.git
        git+https://github.com/xiph/rnnoise.git)
sha256sums=(SKIP SKIP SKIP)

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-beta/beta/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    local sotto rnn
    sotto=$(sed -n 's/^SOTTO_COMMIT=\([0-9a-f]*\).*/\1/p' $_name/packaging/sotto.sh)
    rnn=$(sed -n 's/.*GIT_TAG *\([0-9a-f]\{40\}\).*/\1/p' $_name/denoise/CMakeLists.txt)
    if [[ -z $sotto || -z $rnn ]]; then
        echo "No sotto ($sotto) or RNNoise ($rnn) pin found in the checkout" >&2
        return 1
    fi
    git -C sotto -c advice.detachedHead=false checkout -q --force "$sotto"
    git -C rnnoise -c advice.detachedHead=false checkout -q --force "$rnn"
}

build() {
    # libsotto and its libcodec2, with upstream's script, from our sotto checkout.
    SOTTO_SOURCE="$srcdir/sotto" SOTTO_WORK="$srcdir/sotto-build" \
        bash -e $_name/packaging/build-sotto.sh "$srcdir/sotto-out"

    cmake -S $_name -B build -G Ninja \
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

    install -Dm644 $_name/packaging/linux/ragtime.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 $_name/app/res/ragtime.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 $_name/app/res/ragtime.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    install -Dm644 $_name/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 sotto-out/licences/sotto.txt sotto-out/licences/codec2.txt \
        -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 rnnoise/COPYING "$pkgdir/usr/share/licenses/$pkgname/rnnoise.txt"
    install -Dm644 $_name/README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
