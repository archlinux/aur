#Mantainer: M0Rf30
pkgname=supersonic-git
pkgver=429.330ab98
pkgrel=1
pkgdesc="Open-source web-based media streamer and jukebox fork of Subsonic"
url="https://github.com/Mach5/supersonic.git"
arch=('i686' 'x86_64')
license=('GPL')
depends=('java-runtime')
makedepends=('maven' 'git')
source=('git+https://github.com/Mach5/supersonic.git'
	'supersonic.rc'
	'supersonic.service')
backup=('var/supersonic/db')

build() {
  cd supersonic
  mvn -P full -Dmaven.test.skip=true -pl subsonic-main -am install 
  mvn -P full -Dmaven.test.skip=true -pl subsonic-booter -am install 
} 

package() {
  cd supersonic
  mkdir -p $pkgdir/var/supersonic
  mkdir -p $pkgdir/etc/rc.d
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp subsonic-booter/src/main/script/supersonic.sh $pkgdir/var/supersonic/
  chmod +x $pkgdir/var/supersonic/supersonic.sh
  cp subsonic-booter/target/supersonic-booter-jar-with-dependencies.jar $pkgdir/var/supersonic/
  cp subsonic-main/{Getting\ Started.html,README.TXT,LICENSE.TXT} $pkgdir/var/supersonic                       
  cp subsonic-main/target/supersonic.war $pkgdir/var/supersonic
  cp $srcdir/supersonic.rc $pkgdir/etc/rc.d/supersonic
  chmod +x $pkgdir/etc/rc.d/supersonic
  cp $srcdir/supersonic.service $pkgdir/usr/lib/systemd/system    
# Change port to avoid conflicts with subsonic
  sed 's/SUPERSONIC_PORT=4040/SUPERSONIC_PORT=4141/g' -i $pkgdir/var/supersonic/supersonic.sh

# Compatibility with both java runtime available in repos and AUR
  javahome="JAVA_HOME=/opt/java/jre:/usr/lib/jvm/java-7-openjdk"
  sed -i "20 i $javahome" $pkgdir/var/supersonic/supersonic.sh  
}

pkgver() {
  cd supersonic
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         '51516851d4ea41f639f52c8152a650c3'
         '37668217ee341b57a043a8a632727f4d')
