# Maintainer: Ryan Thomas <ryant0000@gmail.com>
# Contributor: Ryan Thomas <ryant0000@gmail.com.

pkgname='xmrig-donateless'
_pkgname='xmrig'
pkgver='5.9.0'
pkgrel='2'
pkgdesc='High Perf CryptoNote CPU and GPU (OpenCL, CUDA) miner - No Donate Version'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/${_pkgname}/${_pkgname}"
depends=('libuv' 'libmicrohttpd' 'openssl' 'hwloc')
optdepends=('monero: wallet')
makedepends=('cmake')
conflicts=('xmrig-bin' 'xmrig')
license=('GPL')
backup=("etc/${_pkgname}/${_pkgname}.conf")
source=("${_pkgname}.service"
	"${_pkgname}.sysusers"
	"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1c4fa2898b1252507e885c4bfa2d8d5b20bce2069cb5f703bb084066d560a770'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6'
            'd08fe47bd5c03d7a9e9bcc36ce940a8fc07f802712303d1fc70c20bd80ef695c')
prepare() {
  cd "xmrig-${pkgver}"
  mkdir build
  cd "src/"
  sed -i 's/constexpr const int kDefaultDonateLevel = 5;/constexpr const int kDefaultDonateLevel = 0;/g' donate.h
  sed -i 's/constexpr const int kMinimumDonateLevel = 1;/constexpr const int kMinimumDonateLevel = 0;/g' donate.h
}

build() {
  cd "xmrig-${pkgver}/build"
  cmake .. \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "xmrig-${pkgver}"
  install -Dm775 "build/xmrig" "${pkgdir}/usr/bin/xmrig"
  install -Dm644 "src/config.json" "${pkgdir}/etc/xmrig/xmrig.conf"
  install -Dm644 "${srcdir}/xmrig.service" "${pkgdir}/usr/lib/systemd/system/xmrig@.service"
  install -Dm0644 "${srcdir}/xmrig.sysusers" "${pkgdir}/usr/lib/sysusers.d/xmrig.conf"
}

