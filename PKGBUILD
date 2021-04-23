# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Ryan Thomas <ryant0000@gmail.com>
pkgname=xmrig-donateless
_pkgname='xmrig'
pkgver=6.12.1
pkgrel=1
pkgdesc='High Perf CryptoNote CPU and GPU (OpenCL, CUDA) miner - No Donate Version'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/xmrig/xmrig'
depends=('libuv' 'libmicrohttpd' 'openssl' 'hwloc')
makedepends=('cmake>=2.8')
optdepends=('ocl-icd: AMD GPU mining'
	'opencl-headers: AMD GPU mining'
	'cuda: Nvidia GPU mining')
provides=("xmrig=$pkgver")
conflicts=('xmrig')
license=('GPL3')
backup=("etc/${_pkgname}/${_pkgname}.conf")
source=("${_pkgname}.service"
	"${_pkgname}.sysusers"
	"${pkgname}-${pkgver}.tar.gz::https://github.com/xmrig/xmrig/archive/v${pkgver}.tar.gz")
sha256sums=('1c4fa2898b1252507e885c4bfa2d8d5b20bce2069cb5f703bb084066d560a770'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6'
            '7570030c4b3e257bda190a100dc59f78b74c823af7561222a99b296f5e7b1ac2')
prepare() {
	mkdir -p "${_pkgname}-${pkgver}/build"
	cd "${_pkgname}-${pkgver}/src/"
	sed -i 's/constexpr const int kDefaultDonateLevel = 1;/constexpr const int kDefaultDonateLevel = 0;/g' donate.h
	sed -i 's/constexpr const int kMinimumDonateLevel = 1;/constexpr const int kMinimumDonateLevel = 0;/g' donate.h
}
build() {
	cd "${_pkgname}-${pkgver}/build"
	cmake -DCMAKE_BUILD_TYPE=Release ..
	cmake --build .
}
package() {
	cd "${_pkgname}-${pkgver}"
	install -Dm775 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "src/config.json" "${pkgdir}/etc/${_pkgname}/xmrig.conf"
	install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
	install -Dm0644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}
