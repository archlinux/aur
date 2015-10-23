# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>

# Set to 'y' to enable Numix-like theme for JabRef
# DOESN'T WORK FOR NOW, ENABLING WILL RESULT IN A BROKEN BUILD
_numixicons=

pkgname=jabref-git
pkgver=2.11b4.914.gca4e829
_pkgver=2.80dev
_gitname="jabref"
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java -- built from git"
arch=('any')
url="http://jabref.sourceforge.net/"
license=('GPL')
depends=('java-environment=8')
makedepends=('git')
provides=('jabref')
conflicts=('jabref')
source=('jabref::git+https://github.com/JabRef/jabref.git'
	'jabref.desktop'
	'jabref.sh'
        'crystal_16.tar.gz')
md5sums=('SKIP'
         '5f76feb6b2f66a2ea8b52bca999a934f'
         '6d4ef1d79495d2e09e4c616c9227b0cb'
         '4e84f6a13b94ffc112e1990d8b7861b3')

pkgver() {
  cd $_gitname
  git describe --tags|sed 's/-/./g'| cut -c3-
}

prepare(){
  cd "$srcdir/$_gitname"
  if [ -n "$_numixicons" ]; then
      rm -fr ./src/main/resources/images/crystal_16/
      cp -a "$srcdir"/crystal_16/ ./src/main/resources/images/crystal_16/
  fi
}

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
