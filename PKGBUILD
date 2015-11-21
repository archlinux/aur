# Maintainer: Sedeer el-Showk <s.elshowk@netherrealm.net>

pkgname=freebayes-git
pkgver=1.0.1.r0.gefe685d
pkgrel=1
pkgdesc='A tool for finding polymorphisms in high throughput sequence data.'
arch=('i686' 'x86_64')
url="https://github.com/ekg/freebayes"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('git')
provides=('freebayes')
source=('git://github.com/ekg/freebayes.git'
    'git://github.com/ekg/bamtools.git'
    'git://github.com/ekg/intervaltree.git'
    'git://github.com/illusori/bash-tap.git'
    'git://github.com/ingydotnet/test-simple-bash.git'
    'git://github.com/ekg/vcflib.git'
    'git://github.com/ekg/fastahack.git'
    'git://github.com/ekg/filevercmp.git'
    'git://github.com/ekg/fsom.git'
    'git://github.com/ekg/multichoose.git'
    'git://github.com/ekg/smithwaterman.git'
    'git://github.com/ekg/tabixpp.git')
md5sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)
MAKEFLAGS="-j1" # Multi-threaded build fails

pkgver() {
  cd $srcdir/${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -a intervaltree intervaltree-vcflib

  cd ${pkgname%-git}
  git submodule | sed -e 's/^[- ]//' > ../module-heads
  cd ..

  for module in {bamtools,intervaltree,bash-tap,test-simple-bash,vcflib}; do
    cd ${module}
    git checkout `grep ${module} ../module-heads | cut -d" " -f1`
    cd ..
  done

  cd vcflib
  git submodule | sed -e 's/^[- ]//' > ../vcflibmodule-heads
  cd ..

  for module in {fastahack,filevercmp,fsom,intervaltree-vcflib,multichoose,smithwaterman,tabixpp}; do
    cd ${module}
    git checkout `grep ${module%-vcflib} ../vcflibmodule-heads | cut -d" " -f1`
    cd ..
  done

  cd ${pkgname%-git}
  git submodule init
  git config submodule.bamtools.url "$srcdir/bamtools"
  git config submodule.intervaltree.url "$srcdir/intervaltree"
  git config submodule.bash-tap.url "$srcdir/bash-tap"
  git config submodule.test/test-simply-bash.url "$srcdir/test-simple-bash"
  git config submodule.vcflib.url "$srcdir/vcflib"
  git submodule update

  cd vcflib
  git submodule init
  git config submodule.fastahack.url "$srcdir/fastahack"
  git config submodule.filevercmp.url "$srcdir/filevercmp"
  git config submodule.fsom.url "$srcdir/fsom"
  git config submodule.intervaltree.url "$srcdir/intervaltree-vcflib"
  git config submodule.multichoose.url "$srcdir/multichoose"
  git config submodule.smithwaterman.url "$srcdir/smithwaterman"
  git config submodule.tabixpp.url "$srcdir/tabixpp"
  git submodule update
}

build() {
  cd $srcdir/${pkgname%-git}
  make
}

package() {
  install -Dm644 $srcdir/${pkgname%-git}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  for f in {freebayes,bamleftalign}; do 
    install -D $srcdir/${pkgname%-git}/bin/$f $pkgdir/usr/bin/$f
  done
}
