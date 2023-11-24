# Maintainer: Stephen Erisman <aur at serisman dot com>

pkgname='xmrig-mo'
pkgver='6.21.0mo1'
pkgrel='1'
pkgdesc='High performance RandomX, KawPow, CryptoNight, and AstroBWT CPU/GPU miner, with MoneroOcean auto alg switching'
arch=('x86_64')
url="https://github.com/MoneroOcean/xmrig"
depends=('libuv' 'openssl' 'hwloc')
makedepends=('cmake')
license=('GPL')
source=("${url}/archive/v6.21.0-mo1.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers")
sha256sums=('3c9cd719f5ddf3f3b30ab1e764da5e56bb9465a66d983542cd1b3874120931b8'
            'eceb05ca62896015f4cb2866e9caa516efc9a77a370d9ecf2eaf4763ff315e5f'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6')

prepare() {
  cd "xmrig-6.21.0-mo1"
  [ -d build ] || mkdir build

  msg2 "Resetting donation level to zero"
  sed -i -E '/^(.*DonateLevel = )[0-9]+;$/s//\10;/' src/donate.h
  
  echo "$(echo '#include <stdexcept>' | cat - src/backend/opencl/runners/OclRyoRunner.cpp)" > src/backend/opencl/runners/OclRyoRunner.cpp
}

build() {
  cd "xmrig-6.21.0-mo1/build"
  cmake .. \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_BUILD_TYPE=Release
  make -j$(getconf _NPROCESSORS_ONLN)
}

package() {
  cd "xmrig-6.21.0-mo1"
  install -Dm775 "build/xmrig" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "src/config.json" "${pkgdir}/etc/${pkgname}/${pkgname}.conf.example"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
