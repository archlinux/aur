# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=proovread
pkgver=2.12
pkgrel=4
pkgdesc="large-scale high accuracy PacBio correction through iterative short read consensus"
arch=('i686' 'x86_64')
url="https://github.com/BioInf-Wuerzburg/proovread"
license=('PerlArtistic')
depends=('blasr-git' 'perl-log-log4perl' 'blast+>=2.2.24' 'samtools>=1.1' 'shrimp')
source=("$pkgname::git+https://github.com/BioInf-Wuerzburg/proovread#tag=proovread-2.12")
md5sums=('SKIP')

prepare() {
  cd $srcdir/$pkgname

  git submodule init
  git submodule update

  sed -e "s|'bwa-path' => \$RealBin.'/../util/bwa/'|'bwa-path' => ''|" \
      -e "s|'shrimp-path' => \$RealBin.'/../util/shrimp-2.2.3/'|'shrimp-path' => ''|" \
      -e "s|'blasr-path' => \$RealBin.'/../util/blasr-1.3.1/'|'blasr-path' => ''|" \
      -i proovread.cfg

  sed -e 's|my $cfg_core_file = "$RealBin/../proovread.cfg";|my $cfg_core_file = "/usr/share/proovread/proovread.cfg";|' \
      -e 's|my $cfg_core_file = "../proovread.cfg";|my $cfg_core_file = "/usr/share/proovread/proovread.cfg";|' \
      -i bin/bam2cns \
         bin/proovread \
         bin/sam2cns \
         bin/test_cfg.pl

  sed -e 's|$RealBin/../sample|/usr/share/proovread/sample|' \
      -i bin/proovread
}

build() {
  cd $srcdir/$pkgname/util/bwa

  make
}

# check() {
#   cd $srcdir/$pkgname/t

#   for testfile in *.t ; do
#     perl $testfile
#   done
# }

package() {
  cd $srcdir/$pkgname

  mkdir -p $pkgdir/usr/bin \
           $pkgdir/usr/lib/perl5/vendor_perl \
           $pkgdir/usr/share/proovread/sample

  for file in bin/* util/SeqChunker/bin/* util/bwa/bwa-proovread ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file .pl)
  done

  cp -r lib/* $pkgdir/usr/lib/perl5/vendor_perl

  install -Dm644 proovread.cfg $pkgdir/usr/share/proovread/proovread.cfg

  cp sample/* $pkgdir/usr/share/proovread/sample
}
