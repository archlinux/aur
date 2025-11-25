# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-client
pkgver=1.6.0
pkgrel=1
pkgdesc="Java and Maven components of Guacamole"
arch=('any')
url="https://guacamole.apache.org/"
license=('Apache-2.0')
replaces=('guacamole')
depends=('java-runtime' 'java-environment<=19')
makedepends=('maven' 'java-environment-openjdk<=19')
optdepends=('tomcat8: open source Java Servlet container'
            'tomcat9: open source Java Servlet container')
source=("http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/${pkgver}/source/${pkgname}-${pkgver}.tar.gz"
        "guacamole.properties")
install=guacamole-client.install

md5sums=('deaac52798c0b87da48485dfa919b94f'
         '1f3ec0a32cc3c6b4f7aeb8a3b2e7531b')

backup=('etc/guacamole/guacamole.properties' 'etc/guacamole/user-mapping.xml')

export JAVA_HOME=/usr/lib/jvm/default
export LC_ALL=C
export LANG=en-US.UTF-8

prepare() {
  if [ "$(archlinux-java get | grep -Po '\d+')" -gt "17" ]; then
    echo "ERROR: Java environment needs to be set to any <=17. Java 8 and 11 are fine."
    exit 1
  fi
  cd "$srcdir"/$pkgname-$pkgver
  #mkdir -p guacamole/src/main/frontend/dist
}

build() {
    cd "$srcdir"/$pkgname-$pkgver
    mvn -DskipTests=true package
    #mvn package
}
 
package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -m 775 -p "$pkgdir"/usr/share/guacamole/
  mkdir -p "$pkgdir"/etc/guacamole/
  install -D ${pkgname%-*}/target/${pkgname%-*}-$pkgver.war "$pkgdir"/usr/share/guacamole/guacamole.war
  install -D ${pkgname%-*}/doc/example/user-mapping.xml "$pkgdir"/etc/guacamole/
  install -D "$srcdir"/guacamole.properties "$pkgdir"/etc/guacamole/
}
