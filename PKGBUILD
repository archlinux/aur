# Maintainer: Tao-Yi Lee <tylee@ieee.org>
pkgname=apache_spark
pkgver=1.6.0
pkgrel=1
pkgdesc="Apache Spark™ is a fast and general engine for large-scale data processing."
arch=('i686' 'x86_64')
url="http://spark.apache.org"
license=('apache')
groups=()
depends=('java-environment')
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
_buildname=custom-spark

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
  ./make-distribution.sh --name $_buildname --tgz -Phadoop-2.4 -Pyarn
}

package() {
  _usr=${pkgdir}/usr
  _etc_profiled=${pkgdir}/etc/profile.d
  _usr_lib=${pkgdir}/usr/lib
  _spark_real_home=$_usr_lib/$pkgname-$pkgver
  _spark_link_home=$_usr_lib/$pkgname
  mkdir -p $_spark_real_home
  mkdir -p $_etc_profiled

  cd $_usr_lib
  ln -s $pkgname-$pkgver $pkgname

  # install spark
  tar -xf $srcdir/$_gitname-build/spark-$pkgver-SNAPSHOT-bin-$_buildname.tgz -C $_spark_real_home
  msg "Spark will be installed under /usr/lib/$pkgname"
  mv $_spark_real_home/spark-$pkgver-SNAPSHOT-bin-$_buildname/* $_spark_real_home
  rmdir $_spark_real_home/spark-$pkgver-SNAPSHOT-bin-$_buildname
  echo "export PATH=\$PATH:/usr/lib/$pkgname/bin" >> $_etc_profiled/$pkgname.sh
}

# vim:set ts=2 sw=2 et:
