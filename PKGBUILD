# Contributor: Stunts <f.pinamartins@gmail.com> 
pkgname=raxml-standard-git
pkgver=20150208
pkgrel=1
pkgdesc="Randomized Axelerated Maximum Likelihood - standard version from git"
arch=(i686 x86_64)
url="https://github.com/stamatak/standard-RAxML"
license=('GPL3')

depends=()
optdepends=('openmpi: for buildin MPI capable binary')
makedepends=('git' 'make')
conflicts=('raxml' 'raxml-mpi')
source=('git+git://github.com/stamatak/standard-RAxML.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/standard-RAxML
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

prepare() {
#Check whether the CPU supports SSE3 instruction set:
  if $(grep -q pni /proc/cpuinfo)
  then
      makefile=Makefile.SSE3
      extension=-SSE3
      msg "Using SSE3 instruction set since your CPU seems to support it."
  else
      makefile=Makefile
      extension=''
      msg "Not using SSE3 instructions set since your CPU does not seem to support it."
  fi
}

build() {
  cd ${srcdir}/standard-RAxML
  
  #Build single thread binary
  msg "Building single thread binary..."
  make -f ${makefile}.gcc
  rm *.o

  #Build MPI binary (if OpenMPI is available)
  msg "Looking for mpicc..."
  if $(which mpicc |grep -q "/")
  then
      msg "Found a suitable mpicc, building MPI binary..."
      make -f ${makefile}.MPI.gcc
      rm *.o
      mpi=1
  else
      msg "No suitable mpicc found, skipping MPI binary build."
      mpi=0
  fi

  #Build Pthreads binary
  msg "Building PTHREADS binary..."
  make -f ${makefile}.PTHREADS.gcc
  rm *.o
}

package() {
   
  if $(grep -q pni /proc/cpuinfo) 
  then
      extension=-SSE3
  else
      extension=''
  fi

  install -d ${pkgdir}/usr/bin
  cp ${srcdir}/standard-RAxML/raxmlHPC${extension} ${pkgdir}/usr/bin/
  cp ${srcdir}/standard-RAxML/raxmlHPC-PTHREADS${extension} ${pkgdir}/usr/bin/
  if [ $mpi ]
  then
    cp ${srcdir}/standard-RAxML/raxmlHPC-MPI${extension} ${pkgdir}/usr/bin/
  fi
}
