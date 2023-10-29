# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=ffmpeg-dektec
pkgver=2023.09.0
pkgrel=2
_ffmpegver=6.0
_sdkver=2023.10.0
pkgdesc="FFmpeg Integration for DekTec Devices"
arch=('x86_64')
url="https://www.dektec.com/products/SDK/ffmpeg/"
license=('custom: nonfree and unredistributable')
depends=('dektec-drivers-dkms')
makedepends=('yasm' 'sdl2')
source=("https://ffmpeg.org/releases/ffmpeg-${_ffmpegver}.tar.xz"{,.asc}
        "FFmpeg_v${pkgver}.tar.gz::https://www.dektec.com/products/SDK/ffmpeg/linux/downloads/FFmpeg_v${pkgver}.tar.gz"
        "LinuxSDK_v${_sdkver}.tar.gz::https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz"
        "dektec_changes.patch"
        "040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
        "060-ffmpeg-fix-segfault-with-avisynthplus.patch"
        "070-ffmpeg-binutils2.41-fix.patch::https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/effadce6c756247ea8bae32dc13bb3e6f464f0eb")
noextract=("FFmpeg_v${pkgver}.tar.gz")
sha256sums=('57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89c44e47e289137082'
            'SKIP'
            '18d5f0fc4ded9ccc28978fcf345125d4a91a765eb503e7e61ddacd6ede9be003'
            '8024de517096608628ce0657b0d0fab048145d988a9c5d520fc4328496492c85'
            '326ca3465aa61469bf8a9099a8d24c52234579a03ee3b86e093483c7be174422'
            'd1ad786df86354d218a70b306a50961736c0a6e2d2716bf8de3db31d79957df9'
            'bf563193f450ece58a93db6840c0db33875df945fa81477b9b02fb209d3bf57a'
            'fec03e133521486ca258ae34ddf093eb6aab23f848c4332c367aadbfeaefda04')
validpgpkeys=(FCF986EA15E6E293A5644F10B4322F04D67658D8) # issuer "ffmpeg-devel@ffmpeg.org"

prepare() {
	# https://www.dektec.com/products/SDK/ffmpeg/
	patch -d ffmpeg-${_ffmpegver} -Np1 -i "$srcdir"/dektec_changes.patch
	# https://crbug.com/1251779
	patch -d ffmpeg-${_ffmpegver} -Np1 -i "$srcdir"/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch
	# FS#77813: fix playing ogg files with mplayer
	patch -d ffmpeg-${_ffmpegver} -Np1 -i "$srcdir"/060-ffmpeg-fix-segfault-with-avisynthplus.patch
	# FS#79281: fix assembling with binutil as >= 2.41
	patch -d ffmpeg-${_ffmpegver} -Np1 -i "$srcdir"/070-ffmpeg-binutils2.41-fix.patch

	# Include all files from DekTec
	mkdir -p FFmpeg_v${pkgver}
	bsdtar -xf FFmpeg_v${pkgver}.tar.gz -C FFmpeg_v${pkgver}
	cp FFmpeg_v${pkgver}/fftools/unused_functions.c ffmpeg-${_ffmpegver}/fftools
	cp FFmpeg_v${pkgver}/libavcodec/unused_functions.c ffmpeg-${_ffmpegver}/libavcodec
	cp FFmpeg_v${pkgver}/libavfilter/unused_functions.c ffmpeg-${_ffmpegver}/libavfilter
	cp FFmpeg_v${pkgver}/libavutil/unused_functions.c ffmpeg-${_ffmpegver}/libavutil
	cp FFmpeg_v${pkgver}/libswresample/unused_functions.c ffmpeg-${_ffmpegver}/libswresample
	cp FFmpeg_v${pkgver}/libswscale/unused_functions.c ffmpeg-${_ffmpegver}/libswscale
	cp FFmpeg_v${pkgver}/libavdevice/{dektec_common.c,dektec_common.h,dektec_dec.c,dektec_enc.c} ffmpeg-${_ffmpegver}/libavdevice
	cp FFmpeg_v${pkgver}/libavformat/{sdicommon.c,sdicommon.h,sdidec.c,sdienc_audio.c,sdienc_audio.h,sdienc.c,sdienc_payloadid.c,sdienc_payloadid.h,unused_functions.c} ffmpeg-${_ffmpegver}/libavformat
	cp -r FFmpeg_v${pkgver}/libavresample ffmpeg-${_ffmpegver}/libavresample
	cp FFmpeg_v${pkgver}/tests/fate/sdi.mak ffmpeg-${_ffmpegver}/tests/fate
}

build() {
	cd "ffmpeg-${_ffmpegver}"

	PKG_CONFIG_PATH="${srcdir}/LinuxSDK/DTAPI/Lib/GCC7.5.0/pkgconfig" ./configure \
	--prefix='/usr' \
	--disable-shared \
	--disable-htmlpages \
	--enable-static \
	--enable-small \
	--enable-dektec \
	--enable-nonfree
	make
	# Fasttools
	#make tools/qt-faststart
	# Docs
	#make doc/ff{mpeg,play}.1
	# Rename man files
	cd doc
	rename ffmpeg ffmpeg-dektec *.1
	rename ffplay ffplay-dektec *.1
}

package() {
	# Custom standalone installation
	install -Dm 755 ffmpeg-${_ffmpegver}/ffmpeg "$pkgdir"/usr/bin/ffmpeg-dektec
	install -Dm 755 ffmpeg-${_ffmpegver}/ffplay "$pkgdir"/usr/bin/ffplay-dektec

	# Install man pages
	install -Dm644 -t "$pkgdir/usr/share/man/man1" ffmpeg-${_ffmpegver}/doc/ffmpeg-dektec*.1
	install -Dm644 -t "$pkgdir/usr/share/man/man1" ffmpeg-${_ffmpegver}/doc/ffplay-dektec*.1

	# Standard installation method
	#make DESTDIR="$pkgdir" -C ffmpeg-${_ffmpegver} install install-man
	#install -Dm 755 ffmpeg-${_ffmpegver}/tools/qt-faststart "$pkgdir"/usr/bin/
}
