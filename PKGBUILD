# Maintainer: Luis Aranguren <pizzaman@hotmail.com> 
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=eclair
pkgver=0.14.2
pkgrel=1
pkgdesc='A Scala implementation of the Lightning Network (GUI)'
arch=('any')
url='https://github.com/ACINQ/eclair'
license=('Apache')
depends=('java-environment=21' 'jq')
makedepends=('maven')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f54036dad525ee437646962b3ead146711463aea068be48403ba1eac7cf83d23')

build() {
  cd "${pkgname}-${pkgver}"
  mvn -Dmaven.source.skip=true package -DskipTests
}

check() {
  cd "${pkgname}-${pkgver}"
  #Disabled test due to
  #- recv AcceptChannel (upfront shutdown script) *** FAILED ***
  #java.lang.AssertionError: assertion failed: block took 150.001 seconds, exceeding 150.000 seconds
  #mvn verify
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/opt/${pkgname}"
  bsdtar xf ${pkgname}-front/target/${pkgname}-front-${pkgver}-*-bin.zip --strip-components=1 -C "${pkgdir}/opt/${pkgname}"
  bsdtar xf ${pkgname}-node/target/${pkgname}-node-${pkgver}-*-bin.zip --strip-components=1 -C "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/contrib/${pkgname}-cli.bash-completion" -t "${pkgdir}/etc/profile.d/"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
