# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=java-swing-joxy-git
pkgver=432.4dec02d
pkgrel=1
pkgdesc="Java Swing Look and Feel theme integrated with KDE Oxygen"
arch=('i686' 'x86_64')
url="http://joxy.denvelop.nl/"
license=('GPL3')
depends=('java-runtime' 'qt4' 'oxygen-icons' 'kdelibs')
makedepends=('git' 'maven')
source=('joxy::git+https://github.com/Joxy-LAF/joxy-oxygen.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/joxy"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/joxy/joxy"
  mvn package -Dmaven.test.skip=true -Dmaven.repo.local="$srcdir/m2"
}

#check() {
#  cd "$srcdir/joxy/joxy"
#  mvn test -Dmaven.repo.local="$srcdir/m2"
#}

package() {
  [ $CARCH == 'i686' ] && _arch=i386
  [ $CARCH == 'x86_64' ] && _arch=amd64

  cd "$srcdir/joxy/joxy/install"

  # get the current java path
  JAVA_HOME=`readlink -f /usr/lib/jvm/default`

  install -dm755 "$pkgdir/$JAVA_HOME"/jre/lib/{ext,$_arch}
  install -m644 joxy-*.jar "$pkgdir/$JAVA_HOME/jre/lib/ext/"
  install -m644 libjoxy.so "$pkgdir/$JAVA_HOME/jre/lib/$_arch/"
}

# vim:set ts=2 sw=2 et:
