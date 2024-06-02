# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=ffmpeg-dektec
pkgver=2024.05.0
pkgrel=1
_sdkver=2024.04.0
pkgdesc="FFmpeg Integration for DekTec Devices"
arch=('x86_64')
url="https://www.dektec.com/products/SDK/ffmpeg/"
license=('LicenseRef-nonfree-and-unredistributable')
depends=('dektec-drivers-dkms')
makedepends=('sdl2' 'yasm')
source=("FFmpeg_v${pkgver}.tar.gz::https://www.dektec.com/products/SDK/ffmpeg/linux/downloads/FFmpeg_v${pkgver}.tar.gz"
	"LinuxSDK_v${_sdkver}.tar.gz::https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz")
noextract=("FFmpeg_v${pkgver}.tar.gz")
sha256sums=('c07d952c210967896bb3ab87753e15191936a87b68840034a876b850f423cbf6'
            'feef9fd6310f1903edff87a510db3a78e9a79067006ee659b37d3dd34fa277e6')

prepare() {
	# Extract all files from DekTec upstream
	mkdir -p "${pkgname}-${pkgver}"
	bsdtar -xf "FFmpeg_v${pkgver}.tar.gz" -C "${pkgname}-${pkgver}"
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
		--disable-vulkan \
		--disable-ffprobe \
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
	install -Dvm 755 "${pkgname}-${pkgver}/ffmpeg" "$pkgdir/usr/bin/ffmpeg-dektec"
	install -Dvm 755 "${pkgname}-${pkgver}/ffplay" "$pkgdir/usr/bin/ffplay-dektec"

	# Standard installation method
	#make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install install-man
	#install -Dm 755 "${pkgname}-${pkgver}/tools/qt-faststart" -t "${pkgdir}/usr/bin"
}
