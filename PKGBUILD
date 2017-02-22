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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/binnavi/archive/v${pkgver}.tar.gz" 'binnavi')
sha512sums=('1829a7a44966a9c985d63b28b7bfd2c75050f45c46ba9f24e3548a53292e59755c617c1baf9297967c8c32d858b7c926f40f97f06ea744618f5e3794a1f8cb90'
            '0e82a391f8b839fe817381568078e53ac6e4e27eabfb222e6381b1b8ab68db6b13a4c5bd8bb079787d0dec7ec4ca4298c6919e2095c3fcdb556d8001a0cd6ea5')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
  mvn dependency:copy-dependencies -Dmaven.repo.local="${srcdir}/${pkgname}-${pkgver}"
  ant build-binnavi-fat-jar 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0644 README.md "${pkgdir}/usr/share/binnavi/README.md"
  install -Dm0644  LICENSE "${pkgdir}/usr/share/licenses/binnavi/LICENSE"
  cd "${srcdir}/${pkgname}-${pkgver}/target/" 
  install -Dm0755  binnavi-all.jar "${pkgdir}/usr/share/java/binnavi/binnavi-all.jar"
  install -D -m0755 "${srcdir}/binnavi" "${pkgdir}/usr/bin/binnavi"
}

# vim:set et sw=2 ts=2 tw=79:
