# Maintainer: Stephen Erisman <aur at serisman dot com>

pkgname='xmrig-mo-beta'
pkgver='4.3.1'
pkgrel='2'
pkgdesc='Beta Version - High performance RandomX and CryptoNight CPU miner, with MoneroOcean auto alg switching'
arch=('x86_64')
url="https://github.com/MoneroOcean/xmrig"
depends=('libuv' 'openssl' 'hwloc')
makedepends=('cmake')
license=('GPL')
source=("${url}/archive/v${pkgver}-beta-mo${pkgrel}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers")
sha256sums=('57d73c8564e53b20bb9e980fc7b6879e5dd361bf1b6d6105aea51b51295ddfe2'
            '1bec7f2714cbf40ef9f881684cc8a13dc35d2e1e376ce55f7f1319ccb630f0d7'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6')

prepare() {
  cd "xmrig-${pkgver}-beta-mo${pkgrel}"
  [ -d build ] || mkdir build

  msg2 "Reseting donation level to zero"
  sed -i -e 's/constexpr const int kDefaultDonateLevel = 5;/constexpr const int kDefaultDonateLevel = 0;/g' \
         -e 's/constexpr const int kMinimumDonateLevel = 1;/constexpr const int kMinimumDonateLevel = 0;/g' src/donate.h
}

build() {
  cd "xmrig-${pkgver}-beta-mo${pkgrel}/build"
  cmake .. \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_BUILD_TYPE=Release
  make -j$(getconf _NPROCESSORS_ONLN)
}

package() {
  cd "xmrig-${pkgver}-beta-mo${pkgrel}"
  install -Dm775 "build/xmrig" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "src/config.json" "${pkgdir}/etc/${pkgname}/${pkgname}.conf.example"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
