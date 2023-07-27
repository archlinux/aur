# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=dektec-dtapiservice-bin
pkgver=2.2.1.22
pkgrel=2
pkgdesc="The DTAPI service is a Linux daemon (service) that manages DekTec's range of demodulator boards."
arch=('i686' 'x86_64')
url="https://www.dektec.com/downloads/SDK/"
license=('unknown')
depends=('dektec-drivers-dkms' 'gcc-libs' 'glibc')
makedepends=()
provides=('dektec-dtapiservice-bin')
conflicts=('dektec-dtapiservice-bin')
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v2023.06.0.tar.gz")
sha256sums=('a69a9c7cb7962768bd0a81c943df78f20e1184e56dd0a029cc1b9486844edd3b')

prepare() {
	cd "${srcdir}/LinuxSDK/DtapiService"
	# untar all files included in the DtapiService.bin file
	_binary="DtapiService.bin"
	_skip=$(awk '/^__START_OF_TARFILE__/ { print NR + 1; exit 0; }' ${_binary})
	tail -n +${_skip} ${_binary} | bsdtar -xzv

	# replace sbin with bin
	sed -i "s|ExecStart=/usr/sbin/DtapiServiced|ExecStart=/usr/bin/DtapiServiced|" DtapiServiced.service
}

package() {
	# 32-bit systems
	_op_mode=$(getconf LONG_BIT)
	if [ ${_op_mode} == '32' ]; then 
		cp "${srcdir}/LinuxSDK/DtapiService/DtapiService32" \
		"${srcdir}/LinuxSDK/DtapiService/DtapiServiced"
	fi
	# 64-bit systems
	if [ ${_op_mode} == '64' ]; then 
		cp "${srcdir}/LinuxSDK/DtapiService/DtapiService64" \
		"${srcdir}/LinuxSDK/DtapiService/DtapiServiced"
	fi

	install -Dvm755 "${srcdir}/LinuxSDK/DtapiService/DtapiServiced" \
	"${pkgdir}/usr/bin/DtapiServiced"
	install -Dvm644 "${srcdir}/LinuxSDK/DtapiService/DtapiServiced.service" \
	"${pkgdir}/usr/lib/systemd/system/DtapiServiced.service"
	install -Dvm644 "${srcdir}/LinuxSDK/License" \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
