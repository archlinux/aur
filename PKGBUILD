# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
# Contributor: Adam Brenner <adam@aeb.io>

pkgname=pulsar
pkgver=4.2.0
pkgrel=1
pkgdesc='Distributed pub-sub messaging system'
arch=('any')
url='https://github.com/apache/pulsar'
license=('Apache')
makedepends=('java-environment>=21'
)
depends=('java-runtime>=21' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apache/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6491def2f54278815111896d4c15967556c2fa956d23424e0448d4a395e77bd9')

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
