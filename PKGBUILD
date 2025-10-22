# Maintainer: a821 at (nospam) mail de
# Contributor: Guoyi Zhang <myname at malacology dot net>
# Contributor: Grey Christoforo <first name @ last name .net>

pkgname=cufflinks-git
pkgver=2.2.1.r89.gdc3b0cb
pkgrel=4
pkgdesc="Transcriptome assembly and differential expression analysis for RNA-Seq"
arch=("x86_64")
url="http://cole-trapnell-lab.github.io/cufflinks/"
license=('BSL-1.0')
depends=('boost-libs' 'eigen' 'python' 'samtools')
makedepends=('boost' 'git')
provides=('cufflinks')
conflicts=('cufflinks')
source=('git+https://github.com/cole-trapnell-lab/cufflinks.git'
        "$pkgname.patch::https://github.com/cole-trapnell-lab/cufflinks/pull/108.patch"
	"configure-ac.patch")
sha256sums=('SKIP'
            '22c7ff96d9081290edb10bbdf4193eb08f6d9b5b64980eb82ce9cb62fb513c97'
            '4034a606ab5b847dc62a79801c658b5eeebd8019a0a06afb4754592f352eea58')

pkgver() {
  cd cufflinks
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cufflinks
  sed -i "s@sprintf((char \*)vdptr(vs),cmdline);@sprintf((char \*)vdptr(vs),\"%s\",cmdline);@g" src/locfit/makecmd.c
  sed -i "s@int curwin;@extern int curwin;@g" src/locfit/startlf.c
  patch -p1 < "../$pkgname.patch"
  patch -p1 < "../configure-ac.patch"
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
