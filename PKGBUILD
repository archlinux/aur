# Maintainer: a821 at (nospam) mail de
# Contributor: Guoyi Zhang <myname at malacology dot net>
# Contributor: Grey Christoforo <first name @ last name .net>

pkgname=cufflinks-git
pkgver=2.2.1.r89.gdc3b0cb
pkgrel=2
pkgdesc="Transcriptome assembly and differential expression analysis for RNA-Seq"
arch=("x86_64")
url="http://cole-trapnell-lab.github.io/cufflinks/"
license=('BSL-1.0')
depends=('boost-libs' 'eigen' 'python' 'samtools')
makedepends=('boost' 'git')
provides=('cufflinks')
conflicts=('cufflinks')
source=('git+https://github.com/cole-trapnell-lab/cufflinks.git'
        "$pkgname.patch::https://github.com/cole-trapnell-lab/cufflinks/pull/108.patch")
sha256sums=('SKIP'
            '22c7ff96d9081290edb10bbdf4193eb08f6d9b5b64980eb82ce9cb62fb513c97')

pkgver() {
  cd cufflinks
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cufflinks
  sed -i '/^AM_INIT_AUTOMAKE$/d;s/c++03/c++14/' configure.ac
  sed -i "s@sprintf((char \*)vdptr(vs),cmdline);@sprintf((char \*)vdptr(vs),\"%s\",cmdline);@g" src/locfit/makecmd.c
  sed -i "s@int curwin;@extern int curwin;@g" src/locfit/startlf.c
  patch -p1 < "../$pkgname.patch"
  autoreconf -fiv
}

build() {
  cd cufflinks
  export CFLAGS+=" -fpermissive"
  ./configure --prefix=/usr
  make
}

package(){
  cd cufflinks
  make DESTDIR="$pkgdir/" install
}
