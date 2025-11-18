# Maintainer: Luis Aranguren <pizzaman@hotmail.com> 
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=eclair
pkgver=0.13.0
pkgrel=1
pkgdesc='A Scala implementation of the Lightning Network (GUI)'
arch=('any')
url='https://github.com/ACINQ/eclair'
license=('Apache')
depends=('java-environment=21' 'jq')
makedepends=('maven')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e6159320479a13f2105d9ec691aac5f2418bc3bf321b5cf695e2dcde4e049e99')

build() {
  cd "${pkgname}-${pkgver}"
  mvn -Dmaven.source.skip=true package install -DskipTests
}

check() {
  cd "${pkgname}-${pkgver}"
  mvn verify
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/opt/${pkgname}"
  bsdtar xf ${pkgname}-front/target/${pkgname}-front-${pkgver}-*-bin.zip --strip-components=1 -C "${pkgdir}/opt/${pkgname}"
  bsdtar xf ${pkgname}-node/target/${pkgname}-node-${pkgver}-*-bin.zip --strip-components=1 -C "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/contrib/${pkgname}-cli.bash-completion" -t "${pkgdir}/etc/profile.d/"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
