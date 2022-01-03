# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-client
pkgver=1.4.0
pkgrel=1
pkgdesc="Java and Maven components of Guacamole"
arch=('any')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
replaces=('guacamole')
depends=('java-runtime' 'tomcat8' 'java-environment<=17')
makedepends=('maven' 'java-environment-openjdk<=17')
source=("http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/${pkgver}/source/${pkgname}-${pkgver}.tar.gz"
        "guacamole.properties")
install=guacamole-client.install

md5sums=('8ec56d5e2e0ca2c5d0e4f7961b136e73'
         '1f3ec0a32cc3c6b4f7aeb8a3b2e7531b')

backup=('etc/guacamole/guacamole.properties' 'etc/guacamole/user-mapping.xml')

export JAVA_HOME=/usr/lib/jvm/default

build() {
  if [ "$(archlinux-java get | grep -Po '\d+')" -lt "17" ]; then
    cd "$srcdir"/$pkgname-$pkgver
    mvn package
  else
    echo "ERROR: Java environment needs to be set to any <=17. Java 8 and 11 are fine."
    exit 1
  fi
}
 
package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -m 775 -p "$pkgdir"/usr/share/guacamole/
  mkdir -p "$pkgdir"/etc/guacamole/
  install -D ${pkgname%-*}/target/${pkgname%-*}-$pkgver.war "$pkgdir"/usr/share/guacamole/guacamole.war
  install -D ${pkgname%-*}/doc/example/user-mapping.xml "$pkgdir"/etc/guacamole/
  install -D "$srcdir"/guacamole.properties "$pkgdir"/etc/guacamole/
}
