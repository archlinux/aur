# Maintainer: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: phiresky <phireskyde+git <at> gmail <dot> com>
# shellcheck shell=bash
pkgname=vapoursynth-plugin-svpflow
pkgver=4.6.263
_pkgver=$pkgver
_svpflow1_ver=4.5.0.205 # version of svpflow1 may be different from svpflow2
pkgrel=1
pkgdesc='SmoothVideo plugin for Vapoursynth'
arch=('x86_64')
url='https://www.svp-team.com/wiki/SVP:Linux'
license=('GPL-2.0-only' 'LicenseRef-svp-team')
depends=('vapoursynth')
makedepends=('p7zip' 'qt6-base' 'nasm')
provides=("vapoursynth-plugin-svpflow1=$_svpflow1_ver"
    "vapoursynth-plugin-svpflow2=$pkgver")
conflicts=('vapoursynth-plugin-svpflow1' 'vapoursynth-plugin-svpflow2-bin')
source=("svpflow1-src-$_svpflow1_ver.zip::https://www.svp-team.com/files/gpl/svpflow1-src.zip"
    "https://www.svp-team.com/files/svp4-linux.$_pkgver.tar.bz2")
sha256sums=('c384b3b969d66f2e22003f87b644fa79ce9093a8af326f7fc79cc305239d05f3'
    '1f24435451d59936a7fd28b7423190a42df36b7d306b2d747741e4efda171bdf')

prepare() {
    rm -rf "$srcdir/installer"
    mkdir "$srcdir/installer"
    echo 'Finding 7z archives in installer...'
    LANG=C grep --only-matching --byte-offset --binary --text $'7z\xBC\xAF\x27\x1C' "$srcdir/svp4-linux-64.run" |
        cut -f1 -d: |
        while read -r ofs; do dd if="$srcdir/svp4-linux-64.run" bs=1M iflag=skip_bytes status=none skip="$ofs" of="$srcdir/installer/bin-$ofs.7z"; done

    echo 'Extracting 7z archives from installer...'
    for f in "$srcdir"/installer/*.7z; do
        7z -bd -bb0 -y x -o"$srcdir/extracted" "$f" plugins/libsvpflow2.so || true
    done
}

build() {
    cd "$srcdir/svpflow1-src"

    pushd jsoncpp
    qmake6
    make
    popd >/dev/null

    pushd svpflow1
    LDFLAGS+=' -Wl,-z,shstk'
    qmake6
    make
    popd >/dev/null
}

package() {
    install -dm755 "$pkgdir/usr/lib/vapoursynth"
    install -m755 "$srcdir/svpflow1-src/release/libsvpflow1.so" "$pkgdir/usr/lib/vapoursynth/libsvpflow1.so"
    install -m755 "$srcdir/extracted/plugins/libsvpflow2.so" "$pkgdir/usr/lib/vapoursynth/libsvpflow2.so"
}
