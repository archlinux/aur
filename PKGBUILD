# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=jabref-git
pkgver=2.11b2.133.g7b14540
_pkgver=2.11dev
_gitname="jabref"
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java -- built from git"
arch=('any')
url="http://jabref.sourceforge.net/"
license=('GPL')
depends=('java-environment' 'sh')
makedepends=('git' 'apache-ant')
provides=('jabref')
conflicts=('jabref')
source=('jabref::git+https://github.com/JabRef/jabref.git' 'jabref.desktop' 'jabref.sh' 'ant-classpath.patch')
md5sums=('SKIP'
         '5f76feb6b2f66a2ea8b52bca999a934f'
         '9da2f8a5010e25bb04c81225309cc9e5'
         '261ee0e47d07640f61a2de1d30f58283')

pkgver() {
  cd $_gitname
  git describe --tags|sed 's/-/./g'| cut -c3-
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i "$srcdir/ant-classpath.patch"
}

build() {
  cd "$srcdir/$_gitname"
  /etc/profile.d/apache-ant.sh
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
