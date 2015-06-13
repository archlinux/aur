# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=transabyss
pkgver=1.5.3
pkgrel=1
pkgdesc='de novo assembly of RNA-Seq data using ABySS'
arch=('any')
url="http://www.bcgsc.ca/platform/bioinfo/software/trans-abyss"
license=('custom')
depends=('abyss' 'blat' 'bowtie2' 'gawk' 'gmap-gsnap' 'python2-biopython' 'python2-igraph' 'python2-pysam' 'samtools')
source=("$pkgname-$pkgver.zip::https://github.com/bcgsc/transabyss/archive/$pkgver.zip"
        transabyss.install
        transabyss-profile.sh)
install=transabyss.install
backup=('etc/transabyss/job_script.cfg'
        'etc/transabyss/model_matcher.cfg'
        'etc/transabyss/transcriptome.cfg')
md5sums=('8323e601face2f5b65f2ff667ae5853e'
         '9c5d33c3294e31dedada51553fa91dee'
         '8367c572ac97d29bfee8b2920cfb957b')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -e 's|#! /usr/bin/env python|#!/usr/bin/env python2|' \
      -i transabyss* utilities/*.py

  sed -e 's|python|python2|' \
      -i analysis/fusion.py

  sed -e 's|time python|time python2|' \
      -i transabyss-analyze

  rm -r prereqs
}

package() {
  cd $srcdir/$pkgname-$pkgver

  mkdir -p $pkgdir/usr/share/transabyss \
           $pkgdir/usr/share/licenses/transabyss \
           $pkgdir/usr/bin \
           $pkgdir/etc/transabyss

  cp -r * $pkgdir/usr/share/transabyss

  for i in transabyss transabyss-analyze transabyss-merge ; do
    ln -s /usr/share/transabyss/$i $pkgdir/usr/bin/$i
  done

  for i in configs/*.cfg ; do
    cp $i $pkgdir/etc/transabyss/$(basename $i)
    ln -sf /etc/transabyss/$(basename $i) $pkgdir/usr/share/transabyss/$i
  done

  install -Dm644 $srcdir/transabyss-profile.sh $pkgdir/etc/profile.d/transabyss.sh

  ln -s /usr/share/transabyss/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
