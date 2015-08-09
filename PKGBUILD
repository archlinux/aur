# Maintainer: Tao-Yi Lee <tylee@ieee.org>
pkgname=apache_spark
pkgver=1.5.0
pkgrel=1
pkgdesc="Apache Spark™ is a fast and general engine for large-scale data processing."
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git://github.com/apache/spark.git')
noextract=()
md5sums=('SKIP') 

_gitroot=git://github.com/apache/spark.git
_gitname=spark

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin  master
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  export JAVA_HOME=/usr/lib/jvm/`archlinux-java get`
  ./make-distribution.sh --name custom-spark --tgz -Phadoop-2.4 -Pyarn
}

package() {
  cp $srcdir/$_gitname-build/spark-$pkgver-SNAPSHOT-bin-custom-spark.tgz $pkgdir
  cd $pkgdir
  tar -xvf spark-1.5.0-SNAPSHOT-bin-custom-spark.tgz
  rm $pkgdir/spark-1.5.0-SNAPSHOT-bin-custom-spark.tgz
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/share
  mkdir $pkgdir/usr/share/$pkgname
  mv $pkgdir/spark-1.5.0-SNAPSHOT-bin-custom-spark/* $pkgdir/usr
  rmdir $pkgdir/spark-1.5.0-SNAPSHOT-bin-custom-spark
  rm $pkgdir/usr/LICENSE
  rm $pkgdir/usr/README.md  
  rm $pkgdir/usr/RELEASE  
  rm $pkgdir/usr/NOTICE
  mv $pkgdir/usr/conf  $pkgdir/usr/share/$pkgname
  mv $pkgdir/usr/data  $pkgdir/usr/share/$pkgname
  mv $pkgdir/usr/ec2  $pkgdir/usr/share/$pkgname
  mv $pkgdir/usr/python  $pkgdir/usr/share/$pkgname
  mv $pkgdir/usr/lib  $pkgdir/usr/share/$pkgname
  mv $pkgdir/usr/examples  $pkgdir/usr/share/$pkgname
}

# vim:set ts=2 sw=2 et:
