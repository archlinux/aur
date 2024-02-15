# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>
basename=trinityrnaseq
pkgname=('trinityrnaseq' 'trinityrnaseq-doc' 'trinityrnaseq-extra')
_pkgname=Trinity
pkgver=2.15.1
pkgrel=1
pkgdesc="Transcriptome assembler for RNA-seq reads \
	 https://doi.org/10.1038%2Fnbt.1883"
url="https://github.com/Trinotate/Trinotate/wiki"
license=('BSD-3-Clause')
arch=('x86_64')
makedepends=('git' 'cmake' 'make' 'python' 'rsync')
source=("git+https://github.com/trinityrnaseq/trinityrnaseq.git#tag=$_pkgname-v$pkgver"
	"string.patch")
sha256sums=('SKIP'
            '9304eae411d76a6ce1846ed06e7311b35175638a74ec6277909ef9d4ba71769b')

prepare(){
  cd $srcdir/$pkgname
  git submodule update --init --recursive
  patch -p1 < $srcdir/string.patch
}

build() {
  cd $srcdir/$pkgname
  make 
  make plugins
}

package_trinityrnaseq() {
  depends=('perl' 'bash' 'glibc' 'java-runtime' 'python' 'zlib')
  # 'xz' 'bzip2' 'curl'

  cd $srcdir/$basename
  mkdir -p $pkgdir/usr/{share/{$pkgname,java},bin}

  ls 

  # Dir 
for dir in Analysis PerlLib PyLib
do
  find $dir -type f -exec install -D -m 755 {} $pkgdir/usr/share/$basename/$dir \;
done

  # Bin
for binadir in Chrysalis/bin Inchworm/bin 
do
  find $binadir -type f -exec install -D -m 755 {} $pkgdir/usr/bin/ \;
done

  install -Dm755 Trinity $pkgdir/usr/bin/Trinity
  install -Dm755 trinity-plugins/BIN/seqtk-trinity $pkgdir/usr/bin/seqtk-trinity
  
  # Java
  install -Dm755 Butterfly/Butterfly.jar $pkgdir/usr/share/Butterfly.jar

  # Plugin
  # Todo: check trinity-plugins/scaffold_iworm_contigs/scaffold_iworm_contigs
  plugins=(
    "trinity-plugins/COLLECTL/examine_resource_usage_profiling.pl"
    "trinity-plugins/COLLECTL/util/collectl_dat_to_time_matrix.py"
    "trinity-plugins/COLLECTL/util/plot_time_vs_resource.Rscript"
    "trinity-plugins/DEXseq_util/dexseq_prepare_annotation.py"
    "trinity-plugins/bamsifter/bamsifter"
    "trinity-plugins/DEXseq_util/dexseq_prepare_annotation.py"
  )
  for plugin in "${plugins[@]}"
  do
    ls $srcdir/$basename/$plugin 
    install -Dm755 $srcdir/$basename/$plugin $pkgdir/usr/share/$pkgname/$plugin
  done

  # Util
  find util -type f -exec install -D -m 755 {} $pkgdir/usr/share/$basename/util \;
}

package_trinityrnaseq-doc(){
  cd $srcdir/$basename
  mkdir -p $pkgdir/usr/share/doc/$basename/wiki

for note in developer.notes Changelog.txt README README.md
do
  install -Dm644 $note $pkgdir/usr/share/doc/$basename/$note
done

  find trinityrnaseq.wiki -type f -exec install -D -m 644 {} $pkgdir/usr/share/doc/$basename/wiki \;

}

package_trinityrnaseq-extra(){
  depends=('bash' 'perl')

  cd $srcdir/$basename
  mkdir -p $pkgdir/usr/share/$basename/{trinity_ext_sample_data,sample_data}

for datadir in trinity_ext_sample_data sample_data 
do
  find $datadir -type f -exec install -D -m 755 {} $pkgdir/usr/share/$basename/$datadir/ \;
done
}
