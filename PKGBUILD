# Maintainer: Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>

pkgname=bcpkix
pkgver=1.50
pkgrel=1
pkgdesc='Java cryptography APIs (Bouncy Castle) package for PKIX/CMS/EAC/DVCS/PKCS/TSP/OPENSSL'
arch=('any')
url='http://www.bouncycastle.org/java.html'
license=('custom')
depends=('bcprov')
makedepends=('java-environment')
source=("http://www.bouncycastle.org/download/bcpkix-jdk15on-${pkgver/./}.tar.gz")
sha256sums=('0be5bb948ec481b3d1f30ee80ef593b298b3782697f9eeee5c74cf270689b520')

build() {
  cd "${srcdir}/bcpkix-jdk15on-${pkgver/./}"
  jar xf src.zip

  [ -d classes ] || mkdir classes
  find . -name '*.java' | grep -v '\/test\/' > src.list # Remove tests, they are broken
  javac -encoding ISO-8859-1 -cp /usr/share/java/bcprov.jar -d classes @src.list

  cd classes
  find . -depth -type d -empty -delete
  jar cf ../bcpkix.jar *
}

package() {
  cd "${srcdir}/bcpkix-jdk15on-${pkgver/./}"
  install -m755 -d "${pkgdir}/usr/share/java"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 bcpkix.jar "${pkgdir}/usr/share/java/"
  install -m644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}
