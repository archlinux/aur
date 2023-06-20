# Maintainer: Luis Aranguren <pizzaman@hotmail.com> 
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=eclair
pkgver=0.9.0
pkgrel=1
pkgdesc='A Scala implementation of the Lightning Network (GUI)'
arch=('any')
url='https://github.com/ACINQ/eclair'
license=('Apache')
depends=('java-environment=11' 'jq')
makedepends=('maven')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9ba443f51940adc963e8ba78b62d7d0222088bb3f58d8b8df702ac3b32160e4c')

build() {
  cd "${pkgname}-${pkgver}"
  mvn package install -DskipTests
}

check() {
  cd "${pkgname}-${pkgver}"
#  mvn verify
# Will enable when upstream fixes
#  https://github.com/ACINQ/eclair/pull/2493
#  *** 1 TEST FAILED ***
#  MempoolTxMonitorSpec:
#  - transaction confirmed *** FAILED ***

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/opt/${pkgname}"
  bsdtar xf ${pkgname}-front/target/${pkgname}-front-${pkgver}-*-bin.zip --strip-components=1 -C "${pkgdir}/opt/${pkgname}"
  bsdtar xf ${pkgname}-node/target/${pkgname}-node-${pkgver}-*-bin.zip --strip-components=1 -C "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/contrib/${pkgname}-cli.bash-completion" -t "${pkgdir}/etc/profile.d/"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
