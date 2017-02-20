# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
pkgname='binnavi'
pkgver=6.1.0
pkgrel=2
pkgdesc="A binary analysis IDE that allows to inspect, navigate, edit and annotate control flow graphs and call graphs of disassembled code"
arch=('any')
url="https://github.com/google/binnavi"
license=('Apache')
makedepends=('maven' 'apache-ant' 'java-environment>=8')
depends=('java-runtime>=8' 'postgresql')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/binnavi/archive/v6.1.0.tar.gz" 'binnavi')
sha512sums=('1829a7a44966a9c985d63b28b7bfd2c75050f45c46ba9f24e3548a53292e59755c617c1baf9297967c8c32d858b7c926f40f97f06ea744618f5e3794a1f8cb90'
            'bb274ca29a994ef8b98aa77e0be745e297bd2f7e65dd394594169ffec3910b4dd4982e353202c6b201472632a3f7b16bd7d905b7006e21d76b7299b78fc7f390')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  mvn dependency:copy-dependencies -Dmaven.repo.local="${srcdir}/${pkgname}-${pkgver}"
  ant build-binnavi-fat-jar 
}

package() {
  mkdir -p "${pkgdir}/usr/share/java/binnavi"
  mkdir -p "${pkgdir}/usr/share/licenses/binnavi"
  mkdir -p "${pkgdir}/usr/share/binnavi"
  cd "${srcdir}/${pkgname}-${pkgver}"
  mv README.md "${pkgdir}/usr/share/binnavi/"
  mv LICENSE "${pkgdir}/usr/share/licenses/binnavi"
  cd "${srcdir}/${pkgname}-${pkgver}/target/" 
  mv binnavi-all.jar "${pkgdir}/usr/share/java/binnavi/"
  install -D -m755 "${srcdir}/binnavi" "${pkgdir}/usr/bin/binnavi"
}

# vim:set et sw=2 ts=2 tw=79:
