# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname='xmrig-nvidia'
pkgver=2.4.2
pkgrel=3
pkgdesc='Monero cryptocurrency GPU miner, HTTP API disabled'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-nvidia'
depends=('libuv' 'cuda')
optdepends=('monero: wallet')
makedepends=('cmake' 'libuv' 'cuda')
license=('GPL')
changelog=CHANGELOG.md
source=("${url}/archive/v${pkgver}.tar.gz"
        "README.md"
        "CHANGELOG.md")
sha256sums=('9a51fb5494131ec516bfd708c82ebf6eb2b39309181ca7e395b581ab5299d267'
            'fb078354728344095ad35ca85d26ffd69ea89de293ca2950ed40e5bce16d576b'
            '17207f715a2b1245965ac95d68273bd853235db2e4446ffdbc5de39770e3c22f')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create build dir
  [ -d build ] || mkdir build

  # reset default donate level
  sed -i -e 's/constexpr const int kDonateLevel = 5;/constexpr const int kDonateLevel = 0;/g' src/donate.h
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake -DWITH_HTTPD=OFF -DCMAKE_C_COMPILER=gcc-6 -DCMAKE_CXX_COMPILER=g++-6 ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm775 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 src/config.json "${pkgdir}/usr/share/doc/xmrig-nvidia/config.json.example"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig-nvidia/README.md"
  install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/xmrig-nvidia/CHANGELOG.md"
}
