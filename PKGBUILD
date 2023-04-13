# Maintainer: MaximMaximS <sklenicka dot maxim at gmail dot com>
# Contributor: vice <adambadran@me.com>
# Contributor: sum01 <sum01@protonmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Ryan Thomas <ryant0000@gmail.com>

pkgname=xmrig-donateless
_pkgname='xmrig'
pkgver=6.19.2
pkgrel=1
pkgdesc='RandomX, KawPow, CryptoNight, AstroBWT and GhostRider unified CPU/GPU miner and RandomX benchmark - No Donate Version'
url='https://github.com/xmrig/xmrig'
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('libuv' 'openssl' 'hwloc')
makedepends=('cmake')
backup=("etc/${_pkgname}/${_pkgname}.conf")
provides=("xmrig=$pkgver")
conflicts=('xmrig')
source=(https://github.com/xmrig/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz
        xmrig@.service
        xmrig.sysusers)

sha256sums=('84b7d1cc0bb818d471d47a5e663839ae8ba8b8a3b641e227b03903125446e12c'
            'bbc54b04a7da5ea473eb7d976307eb995fbfd96f0d012f1553b8c487182d9fb3'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6')

prepare() {
  cd "${_pkgname}-${pkgver}"
  mkdir -p build
  sed -i 's/constexpr const int kDefaultDonateLevel = 1;/constexpr const int kDefaultDonateLevel = 0;/g' ./src/donate.h
  sed -i 's/constexpr const int kMinimumDonateLevel = 1;/constexpr const int kMinimumDonateLevel = 0;/g' ./src/donate.h
}

build() {
  cd "${_pkgname}-${pkgver}/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm775 "build/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "src/config.json" "${pkgdir}/etc/${_pkgname}/xmrig.conf"
  install -Dm644 "${srcdir}/${_pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "${srcdir}/${_pkgname}.sysusers" -t "${pkgdir}/usr/lib/sysusers.d"
}
