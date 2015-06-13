# Maintainer: Bjoern Bidar <theodorstormgrade@gmail.com>
pkgname=java-swing-globalmenu
pkgver=165
pkgrel=5
pkgdesc="Globalmenu support for swing"
url="http://code.google.com/p/java-swing-ayatana"
arch=('i686' 'x86_64')
license=('MIT')
depends=('java-runtime=7' 'libunity' 'appmenu-gtk2')
makedepends=('jdk7-openjdk' 'svn' 'apache-ant' 'lsb-release')
source='globalmenu_detect.enhance.patch'
md5sums=('ab85e011eace696f9e9a36919faf60f3')





 
_svntrunk='http://java-swing-ayatana.googlecode.com/svn/tags/1.2.4'
_svnmod='jayatana'
 
prepare() {
  cd "$srcdir"
  msg2 "Connecting to SVN server...."
  svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  msg2 "SVN checkout done or server timeout"
  
  # Appling enhance that changes that $pkgname detects for Globalmenu 
  # instead of Uniy 
  patch -Np1 < globalmenu_detect.enhance.patch 
}
 
build() {
  cd "$srcdir/$_svnmod"
  msg2 "Connecting to SVN server...."
  svn up -r "$pkgver"
  msg2 "SVN update done or server timeout"
}
 
package() {
  java7="$pkgdir/usr/lib/jvm/java-7-openjdk"
  cd $srcdir/$_svnmod/$_svnmod
  msg2 "hacking in “dependency” for build"
  mkdir -p "$java7/jre/lib"
  touch "$java7/jre/lib/rt.jar"
  msg2 "fixing build.xml"
  sed -E -i.bak "s+(link|dir|file|todir)=\"/usr/lib/jayatana+\1=\"$pkgdir/usr/lib/jayatana+; s+\"/etc/jayatana.rules.d+\"$pkgdir/etc/jayatana.rules.d+" build.xml
  msg2 "setting user and config home"
  ant config -Duser.home="$srcdir" -Djava.home.7="$java7" || return 1
  msg2 "setting java binary home"
  ant -Dplatforms.JDK_1.6.home="/usr/lib/jvm/java-7-openjdk" || return 1
  msg2 "installing"
  ant -Duser.home="$srcdir" install
  msg2 "cleaning up hack"
  rm "$java7/jre/lib/rt.jar"
}
