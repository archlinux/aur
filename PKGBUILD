# Maintainer: Cedric Meury <cedric@meury.com>
# Maintainer: Michael Louis Thaler <michael.louis.thaler@gmail.com>
pkgname=kafka-manager
pkgver=3.0.0.4
pkgrel=1
pkgdesc="A tool for managing Apache Kafka. Also known as CMAK."
arch=('any')
url="https://github.com/yahoo/CMAK"
license=('Apache')
groups=()
# running kafka-manager requires java11+
depends=('java-environment>=11'
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
source=($pkgname-$pkgver.tar.gz::https://github.com/yahoo/$pkgname/archive/$pkgver.tar.gz
        ${pkgname}.conf
        ${pkgname}.service)
md5sums=('d19a1ba3fcc81ddba18ac0533d073183'
         'ce078e82f517feb2ba27db7d52e79324'
         'a5307a86a62d2689c11e9ef5d9619b1c')

build() {
  cd "CMAK-$pkgver"
  ./sbt clean dist
}

package() {
  mkdir $pkgdir/opt
  unzip -q $srcdir/CMAK-$pkgver/target/universal/cmak-$pkgver.zip -d $pkgdir/opt
  ln -s "/opt/cmak-$pkgver" "${pkgdir}/opt/$pkgname"
  install -D -m644 "${srcdir}/$pkgname.conf" "${pkgdir}/etc/${pkgname}.conf"
  install -D -m644 "${srcdir}/$pkgname.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" 
}
