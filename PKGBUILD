# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=ffmpeg-dektec
pkgver=2023.09.0
pkgrel=3
_sdkver=2024.01.0
pkgdesc="FFmpeg Integration for DekTec Devices"
arch=(x86_64)
url="https://www.dektec.com/products/SDK/ffmpeg/"
license=('custom: nonfree and unredistributable')
depends=(dektec-drivers-dkms)
makedepends=(
	yasm 
	sdl2
)
source=("FFmpeg_v${pkgver}.tar.gz::https://www.dektec.com/products/SDK/ffmpeg/linux/downloads/FFmpeg_v${pkgver}.tar.gz"
	"LinuxSDK_v${_sdkver}.tar.gz::https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz"
	"070-ffmpeg-binutils2.41-fix.patch::https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/effadce6c756247ea8bae32dc13bb3e6f464f0eb")
noextract=("FFmpeg_v${pkgver}.tar.gz")
sha256sums=('18d5f0fc4ded9ccc28978fcf345125d4a91a765eb503e7e61ddacd6ede9be003'
            '3b767e61a88833e23e735852ae448a8c17985397f416bd2655841faa14e75ff0'
            'fec03e133521486ca258ae34ddf093eb6aab23f848c4332c367aadbfeaefda04')

prepare() {
	# Extract all files from DekTec upstream
	mkdir -p ${pkgname}-${pkgver}
	bsdtar -xf FFmpeg_v${pkgver}.tar.gz -C ${pkgname}-${pkgver}
	# FS#79281: fix assembling with binutil as >= 2.41
	patch -d ${pkgname}-${pkgver} -Np1 -i "$srcdir"/070-ffmpeg-binutils2.41-fix.patch
}

build() {
	cd "${pkgname}-${pkgver}"
	# Include pkg-config path for DTAPI
	export PKG_CONFIG_PATH="${srcdir}/LinuxSDK/DTAPI/Lib/GCC7.5.0/pkgconfig"
	# Build
	./configure \
	--prefix='/usr' \
	--disable-shared \
	--disable-doc \
	--disable-asm \
	--enable-static \
	--enable-small \
	--enable-dektec \
	--enable-nonfree
	make
	# Fasttools
	#make tools/qt-faststart
}

package() {
	# Custom standalone installation
	install -Dvm 755 ${pkgname}-${pkgver}/ffmpeg "$pkgdir"/usr/bin/ffmpeg-dektec
	install -Dvm 755 ${pkgname}-${pkgver}/ffplay "$pkgdir"/usr/bin/ffplay-dektec
	install -Dvm 755 ${pkgname}-${pkgver}/ffprobe "$pkgdir"/usr/bin/ffprobe-dektec

	# Standard installation method
	#make DESTDIR="$pkgdir" -C ${pkgname}-${pkgver} install install-man
	#install -Dm 755 ${pkgname}-${pkgver}/tools/qt-faststart "$pkgdir"/usr/bin/
}
