# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname=xmrig-nvidia
pkgver=2.14.5
pkgrel=1
pkgdesc='Monero cryptocurrency GPU miner, HTTP API disabled, donation percentage is 0.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-nvidia'
depends=('libuv' 'cuda>=10.1.105-6')
optdepends=('monero: wallet')
# We unfortunately need to be hard on which version of CUDA we use
makedepends=('cmake' 'libuv' 'openssl' 'cuda>=10.1.105-6')
license=('GPL')
install=xmrig-nvidia.install
changelog=CHANGELOG.md
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-param.service"
        "${pkgname}.sysusers")
sha256sums=('4081aeacf9c3d2f3927c2cbb456640d276249bce3ae5320c19967dbbca3a6532'
            'a0cd0a4fc7fac309eb667c404a721eae0dd5e19546fa64ea7d4e35713deab9e2'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create build dir
  [ -d build ] || mkdir build

  # reset default donate level
  msg2 "Reseting donation level to zero"
  sed -i -e 's/constexpr const int kDefaultDonateLevel = 5;/constexpr const int kDefaultDonateLevel = 0;/g' \
         -e 's/constexpr const int kMinimumDonateLevel = 1;/constexpr const int kMinimumDonateLevel = 0;/g' src/donate.h
}

build() {
  cd "${pkgname}-${pkgver}/build"

  cmake -DWITH_HTTPD=OFF ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm775 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 src/config.json "${pkgdir}/usr/share/doc/${pkgname}/config.json.example"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  # add systemd service
  install -d "${pkgdir}/etc/${pkgname%-nvidia}"
  install -Dm644 "${srcdir}/${pkgname}-param.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
