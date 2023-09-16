# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-avfifo-examples
pkgver=2023.2
pkgrel=1
_sdkver=2023.08.0
pkgdesc='AvFifoExamples - DekTec AvFifo (SMPTE 2110) Code Examples for Linux'
arch=('x86_64')
url="https://www.dektec.com/downloads/SDK/#linux"
license=('custom')
depends=('sdl2' 'dektec-drivers-dkms')
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz"
		"https://www.dektec.com/products/SDK/AvFifoExamples/downloads/avfifo_examples.tar.gz")
sha256sums=('144da46bb3c2be721682820ca33d4fc08d6545f31b3adbb906a90b5eb36e3fb3'
            '378109bd8548ff6d210f78efd24057022c5fb1e96e74a570b62fab7941c1c8bb')

prepare() {
	cd "$srcdir"

	# Include DTAPI (SDK) for AvFifo
	cp LinuxSDK/DTAPI/Include/DTAPI.h avfifo_examples/Common/DTAPI/include
	cp LinuxSDK/DTAPI/Include/DTAPI_AvFifo.h avfifo_examples/Common/DTAPI/include
	cp -r LinuxSDK/DTAPI/Lib/GCC7.5.0/* avfifo_examples/Common/DTAPI/lib/GCC8/
}

build() {
	# Compile AvFifoRx
	cd "$srcdir"/avfifo_examples/AvFifo_VideoRx
	make
	# Compile AvFifoTx
	cd "$srcdir"/avfifo_examples/AvFifo_VideoTx
	make
}

package() {
	install -Dvm755 "$srcdir"/avfifo_examples/AvFifo_VideoRx/AvFifo_VideoRx "$pkgdir"/usr/bin/AvFifo_VideoRx
	install -Dvm755 "$srcdir"/avfifo_examples/AvFifo_VideoTx/AvFifo_VideoTx "$pkgdir"/usr/bin/AvFifo_VideoTx
	install -Dvm644 "$srcdir"/LinuxSDK/License "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
