# Maintainer: Nick Shvelidze <captain@pirrate.me>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

_pkgname=playonlinux5
pkgname=$_pkgname-git
pkgver=5.0.0.g4440f79
pkgrel=1
epoch=1
pkgdesc="GUI for managing Windows programs under linux"
url="http://www.playonlinux.com/"
license=('GPL')
depends=('wine' 'maven' 'jdk8-openjdk' 'java-openjfx' 'gradle' 'java-gnome')
arch=('any')
provides='playonlinux5'
conflicts='playonlinux5'
source=("$_pkgname::git://github.com/PlayOnLinux/POL-POM-5.git")
options=(!strip)
md5sums=('SKIP')

basedir=$(pwd)

# No releases available yet
# pkgver() {
# 	cd "$_pkgname"
# 	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
# }

package() {
	cd "$srcdir/$_pkgname"

  mkdir -p $pkgdir/.m2
  export MVN_REPO=$pkgdir/.m2
  export PATH=$PATH:$M2_HOME/bin
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
  mvn="mvn -Dmaven.repo.local=$MVN_REPO"

  $mvn clean
  $mvn assembly:assembly

	install -d "$pkgdir/opt/$_pkgname"
	install -d "$pkgdir/usr/bin"
	cp "$srcdir/$_pkgname/target/playonlinux-5.0-SNAPSHOT-jar-with-dependencies.jar" "$pkgdir/opt/$_pkgname/$_pkgname.jar"
	rm -rf "$pkgdir/usr/share/$_pkgname/.git"

	echo '#!/bin/bash' > "$pkgdir/usr/bin/$_pkgname"
	echo "java -jar /opt/$_pkgname/$_pkgname.jar \"\$@\"" >> "$pkgdir/usr/bin/$_pkgname"
	chmod +x "$pkgdir/usr/bin/$_pkgname"

  install -D "$basedir/logo256.png" "$pkgdir/usr/share/icons/playonlinux5.png"
	install -D -m644 "$basedir/PlayOnLinux.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i 's/ %F//g' "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
