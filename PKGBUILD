# Maintainer: onefire <onefire.myself@gmail.com>
pkgname=java-jblas-intel
pkgver=20150713
pkgrel=1
pkgdesc="Linear algebra library for Java based on BLAS and LAPACK. Attention: This package needs Intel Math Kernel Library which is NOT in the repositories."
arch=('x86_64')
url=("https://github.com/mikiobraun/jblas")
license=('custom')
provides=('java-jblas')
conflicts=('java-jblas')
makedepends=('ruby' 'apache-ant')
depends=('java-environment' 'java-runtime')

build() {
  git clone https://github.com/mikiobraun/jblas.git  
  cd $srcdir/jblas 
  
  ./configure --lapack=/opt/intel/mkl/lib/intel64 \
  --lapack=/opt/intel/mkl/lib/intel64 \
  --libpath=/opt/intel/mkl/lib/intel64:\
  /opt/intel/composer_xe_2015.2.164/ipp/lib/intel64:\
  /opt/intel/composer_xe_2015.2.164/tbb/lib/intel64 \
  --libs=mkl_rt

  mkdir -p $srcdir/jblas/target/c  
	
  make 
  
  ant minimal-jar  
}

package() {
  cd $srcdir/jblas
  install -Dm 755 jblas-minimal-1.2.3-SNAPSHOT.jar $pkgdir/usr/share/java/jblas-minimal-1.2.3-SNAPSHOT.jar
  
  mkdir -p $pkgdir/usr/lib
  install -m 755 src/main/resources/lib/dynamic/Linux/amd64/libjblas_arch_flavor.so $pkgdir/usr/lib
  install -m 755 src/main/resources/lib/dynamic/Linux/amd64/sse3/libjblas.so $pkgdir/usr/lib   	  

  mkdir -p $pkgdir/etc/profile.d
  echo "export CLASSPATH=\$CLASSPATH:/usr/share/java/jblas-minimal-1.2.3-SNAPSHOT.jar" > $pkgdir/etc/profile.d/jblas.sh 
  chmod 755 $pkgdir/etc/profile.d/jblas.sh
}


