# Maintainer: Adam Brenner <adam@aeb.io>
pkgname=pulsar
pkgver=2.11.0
pkgrel=1
pkgdesc='Distributed pub-sub messaging system'
arch=('any')
url='https://github.com/apache/pulsar'
license=('Apache')
makedepends=('java-environment=17' 'maven')
depends=('java-runtime=17' 'bash' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apache/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('63ef2421b9e09f57cf79c56111f59d320f66ecc6f4a7bd711af4d90ddce66098')

build() {
  cd ${pkgname}-${pkgver}
  mvn package -Pcore-modules,-main -DskipTests
}

package() {
  cd ${pkgname}-${pkgver}
  tar -xzf distribution/server/target/apache-${pkgname}-${pkgver}-bin.tar.gz
  cd apache-${pkgname}-${pkgver}

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find conf -type f -exec install -D -m644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;

  for bin in $(ls bin -I "*.cmd"); do
    if [ -d bin/${bin} ] ; then
      continue
    fi
    install -D -m755 bin/${bin} "${pkgdir}/opt/${pkgname}/bin/${bin}"
  done

  for jar in $(ls lib); do
    install -D -m644 lib/${jar} "${pkgdir}/opt/${pkgname}/lib/${jar}"
  done

  for inst in $(ls instances); do
    if [ -d instances/${inst} ] ; then
      install -d -m755 instances/${inst} "${pkgdir}/opt/${pkgname}/instances/${inst}"
    elif [ -f instances/${inst} ] ; then
      install -D -m644 instances/${inst} "${pkgdir}/opt/${pkgname}/instances/${inst}"
    fi
  done
}

# vim: ts=2 sw=2 et:
