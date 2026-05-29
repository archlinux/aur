# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
# Contributor: Adam Brenner <adam@aeb.io>

pkgname=pulsar
pkgver=4.2.1
pkgrel=1
pkgdesc='Distributed pub-sub messaging system'
arch=('any')
url='https://github.com/apache/pulsar'
license=('Apache-2.0')
makedepends=('java-environment=21'
)
depends=('java-runtime=21' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apache/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('accac7ca40d0a7c175614b81b3bd59d9c791bbb56f9569bde5a86dc92a5682f1')

build() {
    cd ${pkgname}-${pkgver}
    ./mvnw package -DskipTests -Daether.connector.basic.threads=12
   #mvn package -Pcore-modules,-main -DskipTests
}

check(){
    cd ${pkgname}-${pkgver}
    ./mvnw test
}

package() {
  cd ${pkgname}-${pkgver}
  tar -xzf distribution/server/target/apache-${pkgname}-${pkgver}-bin.tar.gz
  cd apache-${pkgname}-${pkgver}

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE ${pkgdir}/usr/share/licenses/${pkgname}/NOTICE
  install -dm777 ${pkgdir}/opt/${pkgname}/logs
  cp -r examples ${pkgdir}/opt/${pkgname}/examples

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
