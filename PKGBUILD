# Maintainer: Markus Heidelberg <markus dot heidelberg at web dot de>

pkgname=javapsionlink-cvs
pkgver=2.0_beta1
pkgrel=3
pkgdesc="Data transfer between Psion EPOC PDA and PC via RS-232; PsiWin clone"
arch=('any')
url="http://littlespikeyland.com/psionlink/"
license=('LGPL')
depends=('java-runtime' 'java-rxtx')
makedepends=('java-environment' 'cvs' 'apache-ant')
install="javapsionlink.install"
source=(replace-javax.comm.patch
        remove-beanshell-classpath.patch
        javapsionlink.desktop
        javapsionlink.sh)
md5sums=('29ac8e314bc13e912f74ebeee340ac88'
         '9c1f3669a4ed6ef1ee0a6940be7f2cf2'
         '20581709a51cbad21029bc8b829ae1df'
         '8d8ec03c8acf71f12b70794187286c94')

_cvsroot=":pserver:anonymous:@javapsionlink.cvs.sourceforge.net:/cvsroot/javapsionlink"
_cvsmod="javapsionlink"

build() {
  cd "$srcdir"
  msg "Connecting to CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -P -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  patch -p1 < "$srcdir/replace-javax.comm.patch"
  patch -p1 < "$srcdir/remove-beanshell-classpath.patch"

  #
  # BUILD HERE
  #
  ant -lib /usr/share/java/rxtx/ jar
}

package() {
  cd "$srcdir/$_cvsmod-build"
  install -D -m644 dist/jpl2.jar "$pkgdir/usr/share/java/javapsionlink/jpl2.jar"
  install -D -m644 icon.gif "$pkgdir/usr/share/pixmaps/javapsionlink.gif"
  install -D -m644 "$srcdir/javapsionlink.desktop" "$pkgdir/usr/share/applications/javapsionlink.desktop"
  install -D -m755 "$srcdir/javapsionlink.sh" "$pkgdir/usr/bin/jpl2"
}
