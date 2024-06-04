# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>
basename=trinityrnaseq
pkgname=('trinityrnaseq' 'trinityrnaseq-doc' 'trinityrnaseq-extra')
_pkgname=Trinity
pkgver=2.15.1
pkgrel=2
pkgdesc="Transcriptome assembler for RNA-seq reads \
	 https://doi.org/10.1038%2Fnbt.1883"
url="https://github.com/Trinotate/Trinotate/wiki"
license=('BSD-3-Clause')
arch=('x86_64')
makedepends=('git' 'cmake' 'make' 'python' 'rsync')
source=("git+https://github.com/trinityrnaseq/trinityrnaseq.git#tag=$_pkgname-v$pkgver"
	"string.patch")
sha256sums=('3764a52e34eacdf4affc1ab719901e90c68e326b9be7b70a8bacdb8843e0aedf'
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
  set -x
  cd $srcdir/trinityrnaseq
  mkdir -p $pkgdir/usr/{share/{trinityrnaseq,java},bin}

  # Dir 
for dir in Analysis PerlLib PyLib
do
  mkdir -p $pkgdir/usr/share/trinityrnaseq/$dir
  find $dir -type f -exec install -D -m 755 {} $pkgdir/usr/share/trinityrnaseq/$dir \;
done

  # Bin
for binadir in Chrysalis/bin Inchworm/bin 
do
  find $binadir -type f -exec install -D -m 755 {} $pkgdir/usr/bin/ \;
done

  install -Dm755 Trinity $pkgdir/usr/share/trinityrnaseq/Trinity
  ln -s /usr/share/trinityrnaseq/Trinity $pkgdir/usr/bin/Trinity 
  install -Dm755 trinity-plugins/BIN/seqtk-trinity $pkgdir/usr/bin/seqtk-trinity
  
  # Java
  install -Dm755 Butterfly/Butterfly.jar $pkgdir/usr/share/java/Butterfly.jar

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
    install -Dm755 $srcdir/trinityrnaseq/$plugin $pkgdir/usr/share/$pkgname/$plugin
  done
  # Util
  mkdir -p $pkgdir/usr/share/trinityrnaseq/util
  find util -type f -exec install -D -m 755 {} $pkgdir/usr/share/trinityrnaseq/util \;
}

package_trinityrnaseq-doc(){
  cd $srcdir/trinityrnaseq
  mkdir -p $pkgdir/usr/share/doc/trinityrnaseq/wiki

for note in developer.notes Changelog.txt README README.md
do
  install -Dm644 $note $pkgdir/usr/share/doc/trinityrnaseq/$note
done

  find trinityrnaseq.wiki -type f -exec install -D -m 644 {} $pkgdir/usr/share/doc/trinityrnaseq/wiki \;

}

package_trinityrnaseq-extra(){
  depends=('bash' 'perl')

  cd $srcdir/trinityrnaseq
  mkdir -p $pkgdir/usr/share/trinityrnaseq/{trinity_ext_sample_data,sample_data}

for datadir in trinity_ext_sample_data sample_data 
do
  find $datadir -type f -exec install -D -m 755 {} $pkgdir/usr/share/trinityrnaseq/$datadir/ \;
done
}
