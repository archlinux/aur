# Maintainer: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: phiresky <phireskyde+git <at> gmail <dot> com>
# shellcheck shell=bash
pkgname=vapoursynth-plugin-svpflow
pkgver=4.5.210
_pkgver=$pkgver-1
pkgrel=3
pkgdesc='SmoothVideo plugin for Vapoursynth'
arch=('x86_64')
url='https://www.svp-team.com/wiki/SVP:Linux'
license=('GPL2' 'custom:svp-team')
depends=('vapoursynth')
makedepends=('p7zip' 'qt6-base' 'nasm')
provides=("vapoursynth-plugin-svpflow1" # version of svpflow1 may be different with svpflow2
    "vapoursynth-plugin-svpflow2=${pkgver}")
conflicts=('vapoursynth-plugin-svpflow1' 'vapoursynth-plugin-svpflow2')
source=("svpflow1-src-$pkgver.zip::https://www.svp-team.com/files/gpl/svpflow1-src.zip"
    "https://www.svp-team.com/files/svp4-linux.$_pkgver.tar.bz2")
sha256sums=('c384b3b969d66f2e22003f87b644fa79ce9093a8af326f7fc79cc305239d05f3'
    '940d539ba50e4455fdaebbec07db03870f98f101fbb4ceadda013d1e00c90883')

prepare() {
    rm -rf "$srcdir/installer"
    mkdir "$srcdir/installer"
    echo 'Finding 7z archives in installer...'
    LANG=C grep --only-matching --byte-offset --binary --text $'7z\xBC\xAF\x27\x1C' "$srcdir/svp4-linux-64.run" |
        cut -f1 -d: |
        while read -r ofs; do dd if="$srcdir/svp4-linux-64.run" bs=1M iflag=skip_bytes status=none skip=$ofs of="$srcdir/installer/bin-$ofs.7z"; done

    echo 'Extracting 7z archives from installer...'
    for f in "$srcdir"/installer/*.7z; do
        7z -bd -bb0 -y x -o"$srcdir/extracted" "$f" plugins/libsvpflow2_vs64.so || true
    done
}

build() {
    cd "$srcdir/svpflow1-src"
    declare -r QMAKE_FLAGS="QMAKE_CXX = ${CXX:-c++}"'
QMAKE_CXXFLAGS += $$(CXXFLAGS)
QMAKE_LFLAGS += $$(LDFLAGS)'

    pushd jsoncpp
    echo "$QMAKE_FLAGS" >>jsoncpp.pro
    qmake6
    make
    popd >/dev/null

    pushd svpflow1
    echo "$QMAKE_FLAGS" >>svpflow1.pro
    qmake6
    make
    popd >/dev/null
}

package() {
    install -dm755 "$pkgdir/usr/lib/vapoursynth"
    install -m755 "$srcdir/svpflow1-src/release/libsvpflow1.so" "$pkgdir/usr/lib/vapoursynth/libsvpflow1.so"
    install -m755 "$srcdir/extracted/plugins/libsvpflow2_vs64.so" "$pkgdir/usr/lib/vapoursynth/libsvpflow2.so"
}
