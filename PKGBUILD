# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>

# Set to 'y' to enable Numix-like theme for JabRef
_numixicons=

pkgname=jabref-git
pkgver=2.11b3.251.g9b010a4
_pkgver=2.11dev
_gitname="jabref"
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java -- built from git"
arch=('any')
url="http://jabref.sourceforge.net/"
license=('GPL')
depends=('java-environment' 'sh')
makedepends=('git')
provides=('jabref')
conflicts=('jabref')
source=('jabref::git+https://github.com/JabRef/jabref.git'
	'jabref.desktop'
	'jabref.sh'
        'crystal_16.tar.gz')
md5sums=('SKIP'
         '5f76feb6b2f66a2ea8b52bca999a934f'
         '9da2f8a5010e25bb04c81225309cc9e5'
         'b03d877ebe4312b6c05dbe4a27d13001')

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
  cd "$srcdir/$_gitname"
  ./gradlew antTargets.addgitinfo generateSource antTargets.jars
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 buildant/lib/JabRef-*.jar \
    ${pkgdir}/usr/share/java/JabRef.jar 
  install -Dm755 $srcdir/jabref.sh ${pkgdir}/usr/bin/jabref
  install -Dm644 $srcdir/jabref.desktop \
    ${pkgdir}/usr/share/applications/jabref.desktop
  install -Dm644 buildant/images/JabRef-icon-48.png \
    ${pkgdir}/usr/share/pixmaps/jabref.png
  install -d ${pkgdir}/usr/share/doc/$pkgname
  cp -r buildant/help ${pkgdir}/usr/share/doc/$pkgname
}
