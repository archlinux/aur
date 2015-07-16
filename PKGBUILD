# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=wiggletools
pkgver=1.1
pkgrel=1
pkgdesc="basic operations on the space of numerical functions defined on the genome using lazy evaluators for flexibility and efficiency"
arch=('i686' 'x86_64')
url="https://github.com/Ensembl/WiggleTools"
license=('Apache')
depends=('gsl' 'python2')
makedepends=('git' 'libmariadbclient' 'libpng' 'unzip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ensembl/WiggleTools/archive/v$pkgver.tar.gz")
md5sums=('7b7052b755415936324d7919756bd070')

prepare() {
  cd $srcdir/WiggleTools-$pkgver

  git archive --format=zip -9 --remote=git://genome-source.cse.ucsc.edu/kent.git beta src/userApps > userApps.zip
  unzip -o -d userApps -j userApps.zip
  rm userApps.zip

  sed -e 's|-ltinfo||g' \
      -i samtools/Makefile

  # use python2
  sed -e 's|python test.py|python2 test.py|' \
      -i Makefile

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -i python/wiggletools/*.py
}

build() {
  cd $srcdir/WiggleTools-$pkgver

  pushd userApps
  make fetchSource
  make
  popd

  export KENT_SRC=$PWD/userApps/kent/src
  export TABIX_SRC=$PWD/userApps/samtabix

  make
}

check() {
   cd $srcdir/WiggleTools-$pkgver

   make test
}

package() {
  cd $srcdir/WiggleTools-$pkgver

  install -Dm755 bin/wiggletools $pkgdir/usr/bin/wiggletools

  for pythonscript in bin/*.py ; do
    install -Dm755 $pythonscript $pkgdir/usr/bin/$(basename $pythonscript .py)
  done

  rm $pkgdir/usr/bin/__init__

  for shellscript in bin/*.sh ; do
    install -Dm755 $shellscript $pkgdir/usr/bin/$(basename $shellscript .sh)
  done
}
