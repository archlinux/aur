# Maintainer: Alexandre Bolelli Soares AKA semeion <t3k0@live.com>
# Contributor: Alexandre Bolelli Soares AKA semeion <t3k0@live.com>

pkgname='xmrig-wownero'
pkgver='2.15.4'
pkgrel='1'
pkgdesc='High Perf CryptoNote CPU Miner. Wownero RandomX Algorithm and No Donate patch added'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/SChernykh/xmrig"
depends=('libuv' 'openssl' )
makedepends=('cmake' 'gcc7')
conflicts=('xmrig-bin' 'xmrig' 'xmrig-donateless')
license=('GPL')
backup=("etc/xmrig/xmrig.conf")

source=("https://github.com/wownero/RandomWOW/archive/1.0.3-wow.tar.gz"
        "xmrig.service"
        "xmrig.sysusers"
        "${url}/archive/xmrig-${pkgver}-beta2-randomwow.tar.gz")

sha256sums=('6bf1aedaf22bf819fb306ef2f27ea2d4cc3712295d448c74cf7a02aad70dc7dd'
            '1c4fa2898b1252507e885c4bfa2d8d5b20bce2069cb5f703bb084066d560a770'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6'
            '886d288aec868410109299019d5ee4cfe9b6127a3c84aa644edd0e7a15811d6f')

prepare() {
  # Create Build dir and apply No Donation patch
  cd "${srcdir}/xmrig-xmrig-${pkgver}-beta2-randomwow"
  mkdir build
  cd "src/"
  sed -i 's/constexpr const int kDefaultDonateLevel = 5;/constexpr const int kDefaultDonateLevel = 0;/g' donate.h  
}

build() {
  # Build RandomWOW v1.0.3
  cd "${srcdir}/RandomWOW-1.0.3-wow"
  #CFLAGS="-march=native -mtune=native -Ofast -funroll-loops -funsafe-math-optimizations -fno-plt -pipe" CXXFLAGS="-march=native -mtune=native -Ofast -funroll-loops -funsafe-math-optimizations -fno-plt -pipe"
  CFLAGS="-march=native -mtune=native -Ofast -maes -msse4.1" CXXFLAGS="-march=native -mtune=native -Ofast -maes -msse4.1" \
  CC=/bin/gcc-7 CXX=/bin/g++-7 make VERBOSE=1

  # Copy necessary libs
  mkdir "${srcdir}/xmrig-xmrig-${pkgver}-beta2-randomwow/RandomWOW-lib"
  cp "${srcdir}/RandomWOW-1.0.3-wow/src/randomx.h" "${srcdir}/xmrig-xmrig-${pkgver}-beta2-randomwow/RandomWOW-lib/"
  cp "${srcdir}/RandomWOW-1.0.3-wow/bin/librandomx.a" "${srcdir}/xmrig-xmrig-${pkgver}-beta2-randomwow/RandomWOW-lib/"

  # Build xmrig
  cd "${srcdir}/xmrig-xmrig-${pkgver}-beta2-randomwow/build"
  # CFLAGS="-march=native -mtune=native -Ofast -funroll-loops -funsafe-math-optimizations -fno-plt -pipe" CXXFLAGS="-march=native -mtune=native -Ofast -funroll-loops -funsafe-math-optimizations -fno-plt -pipe"
  CFLAGS="-march=native -mtune=native -Ofast -maes -msse4.1" CXXFLAGS="-march=native -mtune=native -Ofast -maes -msse4.1" \
  CC=/bin/gcc-7 CXX=/bin/g++-7 cmake \
    .. \
    -DRANDOMX_INCLUDE_DIR="${srcdir}/xmrig-xmrig-${pkgver}-beta2-randomwow/RandomWOW-lib" \
    -DRANDOMX_LIBRARY="${srcdir}/xmrig-xmrig-${pkgver}-beta2-randomwow/RandomWOW-lib/librandomx.a" \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_HTTPD=OFF && \
  make VERBOSE=1
}

package() {
  cd "${srcdir}/xmrig-xmrig-${pkgver}-beta2-randomwow"
  install -Dm775 "build/xmrig" "${pkgdir}/usr/bin/xmrig"
  install -Dm644 "src/config.json" "${pkgdir}/etc/xmrig/xmrig.conf"
  install -Dm644 "${srcdir}/xmrig.service" "${pkgdir}/usr/lib/systemd/system/xmrig@.service"
  install -Dm0644 "${srcdir}/xmrig.sysusers" "${pkgdir}/usr/lib/sysusers.d/xmrig.conf"
}

