# Maintainer: orange <?>
# Contributor: sum01 <sum01@protonmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Ryan Thomas <ryant0000@gmail.com>
pkgname=xmrig-donateless
_pkgname='xmrig'
pkgver=6.18.0
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
sha256sums=('b4c7a9fb3084f15f091b6d85ca641470c5056da622c064b61e0708f2d886841e'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6'
            '4531a31c0c095fcae18fdef0157f1e2a6694408abbcff6789c8f3cd6ab2c3ca0')
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
