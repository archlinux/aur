# Maintainer: Cedric Meury <cedric@meury.com>
pkgname=kafka-manager
pkgver=1.3.0.8
pkgrel=4
pkgdesc="A tool for managing Apache Kafka."
arch=('any')
url="https://github.com/yahoo/kafka-manager"
license=('Apache')
groups=()
# running kafka-manager requires java8
depends=('java-environment=8'
         'bash')
makedepends=('sbt'
             'unzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/kafka-manager.conf')
options=()
install=$pkgname.install
changelog=
source=(https://github.com/yahoo/$pkgname/archive/$pkgver.tar.gz
        ${pkgname}.conf
        ${pkgname}.service)
md5sums=('378f41e469e8c8b5c1ae46ba122c012a'
         '8ee7f7d85857bfad3ad087678a47d270'
         '139d1c614f2b1b1c8de0cf0db43698e4')

build() {
  cd "$pkgname-$pkgver"
  PATH=/usr/lib/jvm/java-8-openjdk/bin:$PATH JAVA_HOME=/usr/lib/jvm/java-8-openjdk ./sbt -java-home /usr/lib/jvm/java-8-openjdk clean dist
}

package() {
  mkdir $pkgdir/opt
  unzip -q $srcdir/$pkgname-$pkgver/target/universal/$pkgname-$pkgver.zip -d $pkgdir/opt
  ln -s "/opt/$pkgname-$pkgver" "${pkgdir}/opt/$pkgname"
  install -D -m644 "${srcdir}/$pkgname.conf" "${pkgdir}/etc/${pkgname}.conf"
  install -D -m644 "${srcdir}/$pkgname.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" 
}
