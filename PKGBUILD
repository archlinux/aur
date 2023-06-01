# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: Charles E. Vejnar <ce@vejnar.org>

pkgname=cufflinks
_realname=cufflinks
pkgver=2.2.2.20190706.162801
pkgrel=2
pkgdesc="Transcriptome assembly and differential expression analysis for RNA-Seq."
url="http://cole-trapnell-lab.github.io/cufflinks/"
arch=("x86_64")
license=("BSL")
depends=('python' 'htslib' 'boost-libs')
makedepends=('autoconf' 'make' 'ncurses' 'boost' 'eigen' 'git' 'samtools' 'htslib')
source=("git+https://github.com/cole-trapnell-lab/cufflinks.git"
	"$pkgname.patch::https://github.com/cole-trapnell-lab/cufflinks/pull/108.patch")
sha1sums=('SKIP'
          '081021851cfcc0372bcf1f2e56aa11d0a3b5862c')

pkgver () {
    cd "$srcdir/$pkgname"
    printf "$(cat configure.ac | grep 'AC_INIT' | sed "s@\[@@g;s@\]@@g;s@,@@g" | awk '{print $2}').%s" "$(TZ=UTC git log -1 --pretty='%cd' --date=format-local:%Y%m%d.%H%M%S)"
}

prepare() {
  cd $srcdir/$pkgname
# for 2.2.1
#  sed -i "16d" configure.ac
#  sed -i "s@bam/sam.h@htslib/sam.h@g" src/hits.h
#  sed -i "s@boost/tr1/unordered_map.hpp@boost/unordered_map.hpp@g" src/biascorrection.h
  sed -i "17d" configure.ac
  sed -i "s@sprintf((char \*)vdptr(vs),cmdline);@sprintf((char \*)vdptr(vs),\"%s\",cmdline);@g" src/locfit/makecmd.c
  sed -i "s@int curwin;@extern int curwin;@g" src/locfit/startlf.c
  patch -p1 < $srcdir/$pkgname.patch 
}

build() {
  cd $srcdir/$pkgname
  autoreconf --install
  ./configure --prefix=/usr --with-boost --with-eigen --with-bam \
  LIBS="-lboost_system -lboost_thread -lboost_serialization"
  make CXXFLAGS="-I/usr/include/eigen3 -I/usr/include/htslib/ -std=c++11 -lhts -lpthread"
}

package() {
    cd "$srcdir/$pkgname"
    make install DESTDIR="$pkgdir"
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
