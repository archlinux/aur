# Maintainer: Grey Christoforo <first name @ last name .net>

pkgname=cufflinks
pkgver=2.2.1
pkgrel=5
pkgdesc="Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples.."
arch=("x86_64")
url="http://cole-trapnell-lab.github.io/projects/cufflinks/"
license=('Artistic')
depends=('boost' 'eigen3' 'python2' 'samtools' 'perl')
source=(https://github.com/cole-trapnell-lab/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('80328ff4169f2778c0728a4795da85e2')


prepare() {
  cd $srcdir/$pkgname-$pkgver
 
  sed -i 's,hash\[pos\]\.hash,(hash[pos].hash),g' src/GHash.hh
  
  curl -L https://github.com/cole-trapnell-lab/cufflinks/commit/305ee7ba4fa8e8df095d293b9e0827c6a85679a8.patch | patch -p1
  curl -L https://github.com/cole-trapnell-lab/cufflinks/commit/6c62baa6a9f3a00b71c8fc8f7f4059a7fe49824.patch | patch -p1 
  
  curl -L https://github.com/cole-trapnell-lab/cufflinks/pull/87/commits/b7313fffc9d1e3dc92ce8a90b0dd5b2e16cfd68f.patch | patch -p1  
  
  #curl -L https://github.com/cole-trapnell-lab/cufflinks/pull/108/commits/d1fdcfd1441d1a8c3b5ecaa1b60a4ae876350061.patch | patch -p1
  #curl -L https://github.com/cole-trapnell-lab/cufflinks/pull/108/commits/80219fc315208adb4941a20701d68c25f56db756.patch | patch -p1

  curl -L https://github.com/cole-trapnell-lab/cufflinks/pull/107/commits/7aa2922ab1f4ff600bd6854cdebb4be6d3b06fa5.patch | patch -p1
  
  ./autogen.sh
  # cufflinks uses python2 but archlinux uses python3 as default python
  perl -i -pne '$_ =~ s/python/python2/ if $_ =~ /^#!\/usr/' src/cuffmerge

  export EIGEN_CPPFLAGS="-I/usr/include/eigen3"
  export LDFLAGS="-L/usr/lib -lboost_system"
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  export EIGEN_CPPFLAGS="-I/usr/include/eigen3"
  export LDFLAGS="-L/usr/lib -lboost_system"
  make
}

package() {
	  cd "$srcdir/$pkgname-$pkgver"
	  make DESTDIR="$pkgdir/" install
}
