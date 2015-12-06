# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>

# Set to 'y' to enable Numix-like theme for JabRef
# DOESN'T WORK DUE TO UPSTREAM CHANGES, BUT WILL BE FIXED SOON :)
# _numixicons=

pkgname=jabref-git
pkgver=3.1.r6004.6bc0b53
_pkgver=3.1dev
_gitname="jabref"
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java -- built from git"
arch=('any')
url="http://jabref.sourceforge.net/"
license=('GPL')
depends=('java-environment=8')
makedepends=('git' 'java-environment=8')
provides=('jabref')
conflicts=('jabref')
source=('jabref::git+https://github.com/JabRef/jabref.git'
	'jabref.desktop'
	'jabref.sh')
md5sums=('SKIP'
         '5f76feb6b2f66a2ea8b52bca999a934f'
         '6d4ef1d79495d2e09e4c616c9227b0cb')
       #'crystal_16.tar.gz')

pkgver() {
  cd $_gitname
  printf "3.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare(){
#  cd "$srcdir/$_gitname"
#  if [ -n "$_numixicons" ]; then
#      rm -fr ./src/main/resources/images/crystal_16/
#      cp -a "$srcdir"/crystal_16/ ./src/main/resources/images/crystal_16/
#  fi
#}

build() {
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk
  PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
  cd "$srcdir/$_gitname"
  ./gradlew releaseJar
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 build/releases/JabRef-$_pkgver.jar \
    ${pkgdir}/usr/share/java/JabRef.jar 
  install -Dm755 $srcdir/jabref.sh ${pkgdir}/usr/bin/jabref
  install -Dm644 $srcdir/jabref.desktop \
    ${pkgdir}/usr/share/applications/jabref.desktop
  install -Dm644 build/resources/main/images/icons/JabRef-icon-48.png \
    ${pkgdir}/usr/share/pixmaps/jabref.png
  install -d ${pkgdir}/usr/share/doc/$pkgname
  cp -r build/resources/main/help ${pkgdir}/usr/share/doc/$pkgname
}
