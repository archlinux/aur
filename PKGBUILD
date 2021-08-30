#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=vvc-vtm
_name=VVCSoftware_VTM
_short=VTM
pkgver=14.0
pkgrel=1
pkgdesc='VTM reference software for VVC'
arch=('x86_64')
license=('BSD')
makedepends=(
    'cmake'
)
source=("vvc-vtm.tar.gz::https://vcgit.hhi.fraunhofer.de/jvet/$_name/-/archive/$_short-$pkgver/$_name-$_short-$pkgver.tar.gz")
# https://vcgit.hhi.fraunhofer.de/jvet/VVCSoftware_VTM/-/archive/VTM-14.0/VVCSoftware_VTM-VTM-14.0.tar.gz
b2sums=('81eadb31ae212183b57c5496b675c3673a414e9a4e1bca10f3404bc205830e2ea716354b62804921909c960846feca83865e19a3c25ffd0e8e8403b195fc9f7a')

build() {
    cd "$_name-$_short-$pkgver" || exit

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev

    make
}

package() {
    cd "$_name-$_short-$pkgver" || exit

    cp "bin/parcatStaticd" "bin/vvc_concat"
    cp "bin/EncoderAppStaticd" "bin/vvc_encoder"
    cp "bin/DecoderAppStaticd" "bin/vvc_decoder"
    cp "bin/BitstreamExtractorAppStaticd" "bin/vvc_bitstream_extractor"
    cp "bin/DecoderAnalyserAppStaticd" "bin/vvc_decoder_analyser"
    cp "bin/SEIRemovalAppStaticd" "bin/vvc_sei-removal"
    cp "bin/StreamMergeAppStaticd" "bin/vvc_stream-merge"
    cp "bin/SubpicMergeAppStaticd" "bin/vvc_subpic-merge"

    install -Dm755 -t "${pkgdir}/usr/bin" bin/vvc_*

    install -Dm644 "$srcdir/$_name-$_short-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
