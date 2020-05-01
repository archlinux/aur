# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=waves
pkgver=1.2.4
pkgrel=1
pkgdesc="Reference Waves Blockchain Node (client) implementation in Scala"
arch=('any')
url="https://wavesplatform.com/"
license=('MIT')
depends=('java-runtime>=8')
makedepends=('sbt' 'java-environment>=8')
backup=('etc/waves/waves.conf')
source=(
    "https://github.com/wavesplatform/Waves/archive/v${pkgver}.tar.gz"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles")
sha256sums=(
    "169221245c91828552e53716a04b3434d32407a136fb493eea814e62c67721ee"
    "df4670b201ee1369f18c9bbad3effee1c6e374ac53cc435b7c68ab077eaacf0f"
    "")

build() {
  rm -rf Waves-${pkgver}/node/target/*
  cd Waves-${pkgver}
  sbt packageAll
}

package() {
  dpkg-deb -x Waves-${pkgver}/node/target/${pkgname}_*_all.deb ${pkgdir}
  mv ${pkgdir}/lib/systemd ${pkgdir}/etc/
  rm -rf ${pkgdir}/lib
  rm -rf ${pkgdir}/etc/init
  rm -f ${pkgdir}/etc/waves
  install -Dm0644 "${pkgname}.conf" "${pkgdir}/etc/waves/${pkgname}.conf"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm0644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
