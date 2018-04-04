# Maintainer: Ryan Thomas <ryant0000@gmail.com>
# Contributor: Ryan Thomas <ryant0000@gmail.com.

pkgname='xmrig-donateless'
pkgver='2.6.0'
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
	"xmrig.sysusers"
	"${url}/archive/v${pkgver}-beta1.tar.gz")
sha256sums=('0559837edbe069158909c8379041c01d9e98fb2ec4a62d3fa26b95741b463275'
            '774e7cb1e451d10fc5ef41820841da5510ca4018339f03223588480fd080f049'
            '360f2fd1d00842a34f4cb8117f28aa05d1164d1bc5d1394a5939839cab5f4d11')
prepare() {
  cd "xmrig-${pkgver}-beta1"
  mkdir build
  cd "src/"
  sed -i 's/constexpr const int kDonateLevel = 5;/constexpr const int kDonateLevel = 0;/g' donate.h  
}

build() {
  cd "xmrig-${pkgver}-beta1/build"
  cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "xmrig-${pkgver}-beta1"
  install -Dm775 "build/xmrig" "${pkgdir}/usr/bin/xmrig"
  install -Dm644 "src/config.json" "${pkgdir}/etc/xmmrig/xmrig.conf"
  install -Dm644 "${srcdir}/xmrig.service" "${pkgdir}/usr/lib/systemd/system/xmrig@.service"
  install -Dm0644 "${srcdir}/xmrig.sysusers" "${pkgdir}/usr/lib/sysusers.d/xmrig.conf"
}
