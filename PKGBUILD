# Maintainer: Grey Christoforo <first name @ last name .net>

pkgname=cufflinks-git
pkgver=v2.2.1.r83.gb4fa050
pkgrel=1
pkgdesc="Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples.."
arch=("x86_64")
url="http://cole-trapnell-lab.github.io/projects/cufflinks/"
license=('Artistic')
depends=('boost' 'eigen3' 'python2' 'samtools' 'perl')
source=('git+https://github.com/cole-trapnell-lab/cufflinks.git')
md5sums=('SKIP')

pkgver() {
  cd cufflinks
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cufflinks

  sed -i 's,hash\[pos\]\.hash,(hash[pos].hash),g' src/GHash.hh

  
 
  ./autogen.sh
  # cufflinks uses python2 but archlinux uses python3 as default python
  perl -i -pne '$_ =~ s/python/python2/ if $_ =~ /^#!\/usr/' src/cuffmerge

  export EIGEN_CPPFLAGS="-I/usr/include/eigen3"
  export LDFLAGS="-L/usr/lib -lboost_system"
  ./configure --prefix=/usr
}

build() {
  cd cufflinks
  export EIGEN_CPPFLAGS="-I/usr/include/eigen3"
  export LDFLAGS="-L/usr/lib -lboost_system"
  make
}

package(){
  cd cufflinks
  make DESTDIR="$pkgdir/" install
}
