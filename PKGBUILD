# Contributr Joshua Hardy <joshinsilico@gmail.com>

pkgname='scipion-git'
pkgver=v1.0.1.r12.1dfd3db7fa
pkgrel=1
pkgdesc="An integrative software platform used to obtain 3D models of macromolecular complexes using Electron Microscopy (3DEM)"
arch=('x86_64')
url="https://github.com/I2PC/scipion"
license=('GPL')
depends=(
  'cmake'
  'fftw'
  'freeglut'
  'gawk'
  'gcc'
  'gnuplot'
  'gsl'
  'jdk8-openjdk'
  'lapack'
  'lib32-gcc-libs'
  'libjpeg6-turbo'
  'libxft'
  'libxml++'
  'libxslt'
  'make'
  'openjpeg2'
  'openmpi'
  'python2'
  'tk'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
optdepends=(
  'ctffind3-ctftilt'
  'ctffind4'
  'eman2'
  'gctf'
  'motioncor2'
  'relion'
  'resmap'
  'simple2'
  'spiderweb'
  'summovie'
  'ucsf-chimera'
  'unblur'
)
options=('!strip')
source=(
  'git+https://github.com/I2PC/scipion.git'
  'scipion.csh'
  'scipion.sh'
)
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/scipion"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
  cd "$srcdir/scipion"
  _NPROC=$(nproc --all)
  
  sed -i -e s:"MPI_LIBDIR = /usr/lib64/mpi/gcc/openmpi/lib":"MPI_LIBDIR = /usr/lib/openmpi":g config/templates/scipion.template
  sed -i -e s:"MPI_INCLUDE = /usr/lib64/mpi/gcc/openmpi/include":"MPI_INCLUDE = /usr/include":g config/templates/scipion.template
  sed -i -e s:"MPI_BINDIR = /usr/lib64/mpi/gcc/openmpi/bin":"MPI_BINDIR = /usr/bin":g config/templates/scipion.template
  sed -i -e s:"JAVA_HOME = /usr/lib/jvm/java-7-openjdk":"JAVA_HOME = /usr/lib/jvm/default":g config/templates/scipion.template

  ./scipion config --overwrite

  ./scipion install -j $_NPROC --no-opencv --no-scipy

  ln -s  /opt/ucsf-chimera software/em/chimera
  mkdir software/em/ctffind4
  ln -s /usr/bin/ctffind software/em/ctffind4/ctffind
  ln -s /opt/eman2 software/em/eman2.12
  ln -s /opt/relion software/em/relion-1.4
  ln -s /opt/resmap software/em/resmap
  ln -s /opt/simple2 software/em/simple
  ln -s /opt/spider software/em/spider
  mkdir -p software/em/summovie/bin
  ln -s /usr/bin/summovie software/em/summovie/bin/sum_movie_openmp_7_17_15.exe
  mkdir software/em/unblur
  ln -s /usr/bin/unblur* software/em/.
}

package() {
  cd "${srcdir}"/scipion
  install -d "${pkgdir}"/opt "${pkgdir}"/etc/profile.d
  cp -r "${srcdir}"/scipion "${pkgdir}"/opt/.
  install -D -m755 "${srcdir}"/scipion.sh "${pkgdir}"/etc/profile.d/.
  install -D -m755 "${srcdir}"/scipion.csh "${pkgdir}"/etc/profile.d/.
}
