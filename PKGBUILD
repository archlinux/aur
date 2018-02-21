# Maintainer: Ryan Thomas <ryant0000@gmail.com>
# Contributor: Ryan Thomas <ryant0000@gmail.com.

pkgname='xmrig-donateless'
pkgver='2.4.5'
pkgrel='1'
pkgdesc='High Perf CPU Miner-No Donate Version'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/xmrig/xmrig"
depends=('libuv' 'libmicrohttpd')
optdepends=('monero: wallet')
makedepends=('cmake' 'libuv' 'libmicrohttpd')
conflicts=('xmrig-bin' 'xmrig')
license=('GPL')
backup=("etc/xmrig/xmrig.conf")
source=("xmrig.service"
	"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2107c5ca279a1184d0052a9e4fce4d70f0472354807adb1faa1fd6ff3925cdac'
            'cd292a0395702fd1e7ee84f5f4018f037bc91a1d4723f54bfbaa771f46e67422')
prepare() {
  cd "xmrig-${pkgver}"
  mkdir build
  cd "src/"
  sed -i 's/constexpr const int kDonateLevel = 5;/constexpr const int kDonateLevel = 0;/g' donate.h  
}

build() {
  cd "xmrig-${pkgver}/build"
  cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "xmrig-${pkgver}"
  install -Dm775 "build/xmrig" "${pkgdir}/usr/bin/xmrig"
  install -Dm644 "src/config.json" "${pkgdir}/etc/xmmrig/xmrig.conf"
  install -Dm644 "${srcdir}/xmrig.service" "${pkgdir}/usr/lib/systemd/system/xmrig@.service"
}
