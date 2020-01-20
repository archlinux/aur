# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
pkgname='binnavi'
pkgver=6.1.0
pkgrel=3
pkgdesc="A binary analysis IDE that allows to inspect, navigate, edit and annotate control flow graphs and call graphs of disassembled code"
arch=('any')
url="https://github.com/google/binnavi"
license=('Apache')
makedepends=('maven' 'apache-ant' 'java-environment>=8')
depends=('java-runtime>=8' 'postgresql')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/binnavi/archive/v${pkgver}.tar.gz" 'binnavi')
sha512sums=('cf34da4b3ad7c6ebc6877099e0f990c35f56b989045e41cf97ba4c9bbad54fbea2042e6503fc43fcde4af14498028884d4a5cd0ffa678c78fe102893b9d0febb'
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
