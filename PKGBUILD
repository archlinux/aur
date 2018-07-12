# Maintainer: Ryan Thomas <ryant0000@gmail.com>
# Contributor: Ryan Thomas <ryant0000@gmail.com.

pkgname='xmrig-donateless'
pkgver='2.6.4'
pkgrel='1'
pkgdesc='High Perf CryptoNote CPU Miner-No Donate Version'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/xmrig/xmrig"
depends=('libuv' 'libmicrohttpd')
optdepends=('monero: wallet')
makedepends=('cmake' 'libuv' 'libmicrohttpd')
conflicts=('xmrig-bin' 'xmrig')
license=('GPL')
backup=("etc/xmrig/xmrig.conf")
source=("xmrig.service"
	"xmrig.sysusers"
	"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1c4fa2898b1252507e885c4bfa2d8d5b20bce2069cb5f703bb084066d560a770'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6'
            '94640ba6d3971a6ba91113ce24a5afec95189cf007f8146011f9a3b367011a69')
prepare() {
  cd "xmrig-${pkgver}"
  mkdir build
  cd "src/"
  sed -i 's/constexpr const int kDefaultDonateLevel = 5;/constexpr const int kDefaultDonateLevel = 0;/g' donate.h  
}

build() {
  cd "xmrig-${pkgver}/build"
  cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "xmrig-${pkgver}"
  install -Dm775 "build/xmrig" "${pkgdir}/usr/bin/xmrig"
  install -Dm644 "src/config.json" "${pkgdir}/etc/xmrig/xmrig.conf"
  install -Dm644 "${srcdir}/xmrig.service" "${pkgdir}/usr/lib/systemd/system/xmrig@.service"
  install -Dm0644 "${srcdir}/xmrig.sysusers" "${pkgdir}/usr/lib/sysusers.d/xmrig.conf"
}
