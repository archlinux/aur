# Maintainer: SteamedFish <steamedfish@hotmail.com>
#
# AVS+ ("Guangdian", AVS1-P16) decoder add-on for OnAir, the SDR receiver
# whose Chinese DTMB television support cannot show a picture without it:
# stock FFmpeg's cavs decoder only handles the AVS1 JiZhun profile, while
# Chinese broadcasts use the AVS+ profile (PMT stream type 0x42, sequence
# header profile 0x48).
#
# Since OnAir 3.x the program can load an external decoder on its own
# (docs/CODECS.md, "The AVS+ add-on"): it dlopens libavcodec + libavutil
# from its codec folders and looks for a decoder called "cavs". This
# package installs exactly those two shared libraries (plus what they need
# at run time) into /usr/lib/onair, which is one of the folders OnAir
# searches (<bindir>/../lib/onair), so the picture works out of the box -
# no external player, no configuration.
#
# The only public AVS+ decoder source is maliwen2015/ffmpeg_cavs_dra: an
# MIT patch for FFmpeg 7.1.2. The patch file is malformed (mixed CRLF
# endings, wrong hunk line count for the new libavcodec/libcavs.c), so
# prepare() splits it with the bundled split_cavs_patch.py: the sections
# around libcavs.c apply with patch -p2, libcavs.c itself (a pure
# addition) is extracted line by line.
#
# AVS+ is a patented standard: whether you may build and use this decoder
# depends on the patent rules where you live. Nothing here is bundled by
# OnAir itself; this package is not affiliated with the project.
#
# DRA (the matching DTMB audio codec) is a separate add-on: onair-dra.

pkgname=onair-avsplus
pkgver=7.1.2
pkgrel=2
pkgdesc="AVS+ (Guangdian) decoder add-on for OnAir: shared libavcodec/libavutil with the AVS+ profile, for Chinese DTMB TV"
arch=('x86_64' 'aarch64')
url="https://github.com/adswill/OnAir"
license=('LGPL-2.1-or-later' 'MIT')  # FFmpeg without --enable-gpl, patched with MIT code
depends=('glibc' 'zlib' 'xz')                     # verified with readelf after the build
makedepends=('nasm' 'python')
# ffmpeg's x86 inline asm references static const tables (mask24r/g/b,
# mmx_ff, ...) that LTO drops -> undefined references at link time.
options=('!lto')
# The patch repo has no releases; pin its commit. lilac tracks main and
# rewrites this line (see lilac.yaml); a patch for another FFmpeg release
# fails loudly in prepare() instead of packaging something broken.
_patchcommit=eb94ceb887b47b6ecfbda9da43273dd65246df1e
source=("https://ffmpeg.org/releases/ffmpeg-$pkgver.tar.xz"
        "cavs_dra.patch::https://raw.githubusercontent.com/maliwen2015/ffmpeg_cavs_dra/$_patchcommit/ffmpeg-7.1.2_cavs_dra.patch"
        "LICENSE::https://raw.githubusercontent.com/maliwen2015/ffmpeg_cavs_dra/$_patchcommit/LICENSE"
        "split_cavs_patch.py")
sha256sums=('089bc60fb59d6aecc5d994ff530fd0dcb3ee39aa55867849a2bbc4e555f9c304'
            '1d1cac53cc2d19af39de854db186985fb653e820b0d071844a1e529550c08e40'
            'cac0ae34bd88bc4347c3901c3d6e9715ee64ae9b2ec8e027b0892ecd67db98f4'
            'c82dd616f0f3f1f56176b6590b9b5c506265640182bc4c77c9d16247186d0dda')

prepare() {
    cd "ffmpeg-$pkgver"
    python3 "$srcdir/split_cavs_patch.py" "$srcdir/cavs_dra.patch" "$srcdir" .
    patch -p2 < "$srcdir/cavs_dra-p1.patch"
    patch -p2 < "$srcdir/cavs_dra-p2.patch"
}

build() {
    cd "ffmpeg-$pkgver"
    # shared libraries only: OnAir dlopens them; no programs, no headers
    ./configure \
        --prefix=/usr \
        --disable-static \
        --enable-shared \
        --disable-programs \
        --disable-doc \
        --disable-debug \
        --disable-stripping \
        --disable-swresample \
        --disable-vaapi \
        --disable-vdpau \
        --disable-xlib \
        --disable-libdrm
    make
}

package() {
    cd "ffmpeg-$pkgver"
    # only what OnAir's add-on loader opens (libavcodec + libavutil) and
    # what libavcodec pulls in itself (libswresample)
    install -d "$pkgdir/usr/lib/onair"
    for lib in libavcodec libavutil libswresample; do
        [ -d "$lib" ] || continue
        for f in "$lib"/*.so "$lib"/*.so.*; do
            [ -e "$f" ] || [ -L "$f" ] || continue
            cp -a "$f" "$pkgdir/usr/lib/onair/"
        done
    done
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 COPYING.LGPLv2.1 "$pkgdir/usr/share/licenses/$pkgname/COPYING.LGPLv2.1"
}
