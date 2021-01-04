# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-client
pkgver=1.3.0
pkgrel=1
pkgdesc="Java and Maven components of Guacamole"
arch=('any')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
replaces=('guacamole')
depends=('java-runtime' 'tomcat8' 'jre8-openjdk')
makedepends=('maven' 'jdk8-openjdk')
source=("http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/${pkgver}/source/${pkgname}-${pkgver}.tar.gz"
        "guacamole.properties")
install=guacamole-client.install

md5sums=('c6395f57e92a0dd933de9f1d87039cb5'
         '1f3ec0a32cc3c6b4f7aeb8a3b2e7531b')

backup=('usr/share/tomcat8/.guacamole/guacamole.properties' 'usr/share/tomcat8/.guacamole/user-mapping.xml')

build() {
  # force current Java to 1.8, if not, Guacamole doesn't build
  if [ "$(archlinux-java get)" != "java-8-openjdk" ]; then
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk
    PATH="$JAVA_HOME/bin:$PATH"
  fi
  cd "$srcdir"/$pkgname-$pkgver
  mvn package
}
 
package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -m 775 -p "$pkgdir"/var/lib/tomcat8/
  mkdir -m 775 -p "$pkgdir"/var/lib/tomcat8/webapps/
  mkdir -p "$pkgdir"/usr/share/tomcat8/.${pkgname%-*}/
  install -D ${pkgname%-*}/target/${pkgname%-*}-$pkgver.war "$pkgdir"/var/lib/tomcat8/webapps/guacamole.war
  install -D ${pkgname%-*}/doc/example/user-mapping.xml "$pkgdir"/usr/share/tomcat8/.guacamole/
  install -D "$srcdir"/guacamole.properties "$pkgdir"/usr/share/tomcat8/.guacamole/
}
