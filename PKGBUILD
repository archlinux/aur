# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-dtapiservice-bin
pkgver=5.1.0.119
pkgrel=1
_sdkver=2023.10.0
pkgdesc="The DTAPI service is a Linux daemon (service) that manages DekTec's range of demodulator boards."
arch=('i686' 'x86_64')
url="https://www.dektec.com/downloads/SDK/#linux"
license=('unknown')
depends=('dektec-drivers-dkms' 'gcc-libs' 'glibc')
makedepends=()
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz")
sha256sums=('8024de517096608628ce0657b0d0fab048145d988a9c5d520fc4328496492c85')

prepare() {
	cd LinuxSDK/DtapiService
	# Untar all files included in the DtapiService.bin file
	_binary="DtapiService.bin"
	_skip=$(awk '/^__START_OF_TARFILE__/ { print NR + 1; exit 0; }' ${_binary})
	tail -n +${_skip} ${_binary} | bsdtar -xzv

	# Replace sbin with bin
	sed -i "s|ExecStart=/usr/sbin/DtapiServiced|ExecStart=/usr/bin/DtapiServiced|" DtapiServiced.service
}

package() {
	# 32-bit systems
	_op_mode=$(getconf LONG_BIT)
	if [ ${_op_mode} == '32' ]; then 
		cp "$srcdir"/LinuxSDK/DtapiService/DtapiService32 \
		"$srcdir"/LinuxSDK/DtapiService/DtapiServiced
	fi
	# 64-bit systems
	if [ ${_op_mode} == '64' ]; then 
		cp "$srcdir"/LinuxSDK/DtapiService/DtapiService64 \
		"$srcdir"/LinuxSDK/DtapiService/DtapiServiced
	fi

	install -Dvm755 "$srcdir"/LinuxSDK/DtapiService/DtapiServiced \
	"$pkgdir"/usr/bin/DtapiServiced
	install -Dvm644 "$srcdir"/LinuxSDK/DtapiService/DtapiServiced.service \
	"$pkgdir"/usr/lib/systemd/system/DtapiServiced.service
	install -Dvm644 "$srcdir"/LinuxSDK/License \
	"$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
