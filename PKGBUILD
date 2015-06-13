# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=partitionfinder
pkgver=1.1.1
pkgrel=1
pkgdesc="discovers optimal partitioning schemes for DNA sequences"
arch=('i686' 'x86_64')
url="https://github.com/brettc/partitionfinder"
depends=('python2' 'raxml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brettc/$pkgname/archive/v$pkgver.tar.gz"
        'partitionfinder.sh'
        'partitionfinder-protein.sh')
md5sums=('3129ea6fe0067cbd239099c071dc3db0'
         'SKIP'
         'SKIP')

prepare() {
  cd $srcdir/$pkgname-$pkgver/programs/phyml_source

  sed '/^ARCH_flag/d' -i configure.ac

  autoreconf -i
}

build() {
  cd $srcdir/$pkgname-$pkgver/programs/phyml_source

  ./configure

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  for file in PartitionFinder.py PartitionFinderProtein.py ; do
    install -Dm644 $file $pkgdir/usr/share/partitionfinder/$file
  done

  cp -r partfinder $pkgdir/usr/share/partitionfinder/

  install -Dm644 RELEASE-VERSION $pkgdir/usr/share/partitionfinder/

  install -d $pkgdir/usr/share/doc
  cp -r docs $pkgdir/usr/share/doc/partitionfinder

  # install the out-dated phyml dependency
  install -Dm755 programs/phyml_source/src/phyml $pkgdir/usr/share/partitionfinder/programs/phyml

  # install usable scripts to bin
  install -Dm755 $srcdir/partitionfinder.sh         $pkgdir/usr/bin/partitionfinder
  install -Dm755 $srcdir/partitionfinder-protein.sh $pkgdir/usr/bin/partitionfinder-protein
}
