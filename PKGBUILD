# shellcheck shell=bash
# Maintainer: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: phiresky <phireskyde+git <at> gmail <dot> com>
pkgname=vapoursynth-plugin-svpflow
pkgver=4.5.210
_pkgver=${pkgver}-1
pkgrel=1
pkgdesc='SmoothVideo plugin for Vapoursynth'
arch=('x86_64')
url='https://www.svp-team.com/wiki/SVP:Linux'
license=('GPL2' 'custom')
depends=(vapoursynth)
makedepends=(p7zip)
conflicts=('svp-bin')
source=("https://www.svp-team.com/files/svp4-linux.${_pkgver}.tar.bz2")
sha256sums=('940d539ba50e4455fdaebbec07db03870f98f101fbb4ceadda013d1e00c90883')

prepare() {
    rm -rf "$srcdir/installer"
    mkdir "$srcdir/installer"
    echo 'Finding 7z archives in installer...'
    LANG=C grep --only-matching --byte-offset --binary --text $'7z\xBC\xAF\x27\x1C' "$srcdir/svp4-linux-64.run" |
        cut -f1 -d: |
        while read -r ofs; do dd if="$srcdir/svp4-linux-64.run" bs=1M iflag=skip_bytes status=none skip=$ofs of="$srcdir/installer/bin-$ofs.7z"; done

    echo 'Extracting 7z archives from installer...'
    for f in "$srcdir"/installer/*.7z; do
        7z -bd -bb0 -y x -o"$srcdir/extracted" "$f" plugins/libsvpflow1_vs64.so plugins/libsvpflow2_vs64.so || true
    done
}

package() {
    install -dm755 "$pkgdir/usr/lib/vapoursynth"
    install -m755 "$srcdir/extracted/plugins/libsvpflow1_vs64.so" "$pkgdir/usr/lib/vapoursynth/libsvpflow1.so"
    install -m755 "$srcdir/extracted/plugins/libsvpflow2_vs64.so" "$pkgdir/usr/lib/vapoursynth/libsvpflow2.so"
}
