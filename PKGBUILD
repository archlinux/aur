# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=partitionfinder
pkgver=2.0.0
pkgrel=1
pkgdesc="discovers optimal partitioning schemes for DNA sequences"
arch=('i686' 'x86_64')
url="https://github.com/brettc/partitionfinder"
depends=('python2-pandas' 'python2-pytables' 'python2-scikit-learn')
# TODO add 'phyml' 'raxml' to depends and don't rely on given binaries
source=("$pkgname-$pkgver.tar.gz::https://github.com/brettc/partitionfinder/archive/v$pkgver.tar.gz"
        'partitionfinder.sh'
        'partitionfinder-protein.sh'
        'partitionfinder-morphology.sh')
md5sums=('607fb727c6298ad4ade341516d5d963c'
         '4c2e3eed04f067f3700a60adf074f88d'
         'dd9ad3e167502bb542d235f932edbb27'
         'd447265ae240e0ca1c6dcf86d0cced71')

package() {
  cd $srcdir/$pkgname-$pkgver

  for file in PartitionFinder.py PartitionFinderMorphology.py PartitionFinderProtein.py ; do
    install -Dm644 $file $pkgdir/usr/share/partitionfinder/$file
  done

  cp -r partfinder $pkgdir/usr/share/partitionfinder/

  install -d $pkgdir/usr/share/doc
  cp -r docs $pkgdir/usr/share/doc/partitionfinder

  # install usable scripts to bin
  install -Dm755 $srcdir/partitionfinder.sh            $pkgdir/usr/bin/partitionfinder
  install -Dm755 $srcdir/partitionfinder-protein.sh    $pkgdir/usr/bin/partitionfinder-protein
  install -Dm755 $srcdir/partitionfinder-morphology.sh $pkgdir/usr/bin/partitionfinder-morphology

  # install programs
  install -d $pkgdir/usr/share/partitionfinder/programs

  for program in phyml.linux raxml.linux raxml_pthreads.linux ; do
    install -Dm755 programs/$program $pkgdir/usr/share/partitionfinder/programs/$program
  done

  # TODO for determining fastest raxml / phyml

  # for raxml in raxmlHPC-AVX2 raxmlHPC-AVX raxmlHPC-SSE3 raxmlHPC ; do
  #   if [[ -e /usr/bin/$raxml ]] ; then
  #     ln  -s /usr/bin/$raxml $pkgdir/usr/share/partitionfinder/programs/raxml.linux
  #     break
  #   fi
  # done

  # for raxml_pthreads in raxmlHPC-PTHREADS-AVX2 raxmlHPC-PTHREADS-AVX raxmlHPC-PTHREADS-SSE3 raxmlHPC-PTHREADS ; do
  #     if [[ -e /usr/bin/$raxml_pthreads ]] ; then
  #       ln  -s /usr/bin/$raxml_pthreads $pkgdir/usr/share/partitionfinder/programs/raxml_pthreads.linux
  #       break
  #     fi
  # done

  # ln -s /usr/bin/phyml $pkgdir/usr/share/partitionfinder/programs/phyml.linux
}
