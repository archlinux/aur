# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Angel_Caido

pkgname=dualsub-git
pkgver=v1.0.0.r38.gb38e912
pkgrel=1
pkgdesc="tool for merging and translating subtitles"
url="https://github.com/bonigarcia/dualsub"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('java-environment')
makedepends=('git' 'maven')
md5sums=('SKIP'
         '38af0208f8ec2831c38d72fce55e2a63'
         '3aef26346ba8deac17cea0e0336ea0af')

source=("${pkgname}"::'git+https://github.com/bonigarcia/dualsub' dualsub.png dualsub.desktop)

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}
  mvn clean compile assembly:single
}

package() {
  cd ${srcdir}/${pkgname}
  install -Dm755 ./target/dualsub-1.1.0-jar-with-dependencies.jar ${pkgdir}/usr/share/java/dualsub/dualsub.jar
  install -D -m644 $srcdir/dualsub.png $pkgdir/usr/share/pixmaps/dualsub.png
  install -D -m644 $srcdir/dualsub.desktop $pkgdir/usr/share/applications/dualsub.desktop
  mkdir -p -m755 ${pkgdir}/usr/bin
  echo -e "#!/bin/sh
  java -jar /usr/share/java/dualsub/dualsub.jar" > $pkgdir/usr/bin/dualsub
  chmod 755 ${pkgdir}/usr/bin/dualsub
}
