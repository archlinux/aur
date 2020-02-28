# Maintainer: Murtuza Akhtari <murtuza dot akhtari at gmail dot com>
# Contributor: Murtuza Akhtari <murtuza dot akhtari at gmail dot com>

pkgname=teedy
pkgver=1.7
pkgrel=1
pkgdesc="Documents management made simple"
arch=('any')
url="https://teedy.io/"
license=('GPL2')
replaces=('teedy')
depends=('jre8-openjdk' 'tomcat9' 'tesseract' 'ffmpeg' 'mediainfo')
makedepends=('maven' 'jdk8-openjdk' 'npm' 'grunt-cli')
source=("https://github.com/sismics/docs/archive/v${pkgver}.tar.gz")
md5sums=('cd86ac250eca77120098cda2a3218d87')

build() {
  # Force usage of java8 as jsvc/apache commons-daemon is not compatible with java9 and above
  # for using the latest java version, either modify the tomcatX.service to run tomcat as root 
  # or allow the tomcatX user access to /usr/share/tomcatX/bin.
  if [ "$(archlinux-java get)" != "java-8-openjdk" ]; then
      JAVA_HOME=/usr/lib/jvm/java-8-openjdk
      PATH="$JAVA_HOME/bin:$PATH"
  fi

  cd "$srcdir"/docs-$pkgver/
  mvn -Pprod -DskipTests clean install
}
 
package() {
  cd "$srcdir"/docs-$pkgver/
  mkdir -m 775 -p "$pkgdir"/var/lib/tomcat9/
  mkdir -m 775 -p "$pkgdir"/var/lib/tomcat9/webapps/
  install -D docs-web/target/docs-web-$pkgver.war "$pkgdir"/var/lib/tomcat9/webapps/teedy.war
}
