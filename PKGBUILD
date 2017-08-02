# Maintainer: Michael DeGuzis
 
pkgname=guacamole-client-git
_gitname=guacamole-client
pkgver=0.9.13.incubating.r82.ga5ebc073
pkgrel=1
pkgdesc="Java and Maven components of Guacamole"
arch=('any')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
conflicts=('guacamole-git')
provides=('guacamole')
depends=('java-runtime' 'tomcat7')
makedepends=('git' 'maven')
source=(
		 "$_gitname::git+https://github.com/apache/incubator-guacamole-client"
		 'guacamole.properties'
	   )
install=guacamole-client.install

md5sums=(
		 'SKIP'
		 '1f3ec0a32cc3c6b4f7aeb8a3b2e7531b'
		)
 
backup=('usr/share/tomcat7/.guacamole/guacamole.properties' 'usr/share/tomcat7/.guacamole/user-mapping.xml')
 
pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"/$_gitname
	mvn package
}
 
package() {
	cd "$srcdir"/$_gitname
	mkdir -m 775 -p "$pkgdir"/var/lib/tomcat7/
	mkdir -m 775 -p "$pkgdir"/var/lib/tomcat7/webapps/
	mkdir -p "$pkgdir"/usr/share/tomcat7/.${_gitname%-*}/
	install -D ${_gitname%-*}/target/${_gitname%-*}-*-incubating.war "$pkgdir"/var/lib/tomcat7/webapps/guacamole-incubating.war
	install -D ${_gitname%-*}/doc/example/user-mapping.xml "$pkgdir"/usr/share/tomcat7/.guacamole/
	install -D "$srcdir"/guacamole.properties "$pkgdir"/usr/share/tomcat7/.guacamole/
}
