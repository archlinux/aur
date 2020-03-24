# Maintainer: anon at sansorgan.es
pkgname=madagascar
pkgver=r14561.279e38d29
pkgrel=1
epoch=1
pkgdesc="Multidimensional data analysis and reproducible computational experiments."
url=http://ahay.org/
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libtirpc' 'ffmpeg' 'libxaw' 'cairo' 'fftw' 'netpbm' 'gd'
'openmpi' 'glu' 'freeglut' 'suitesparse' 'python') 
makedepends=('scons' 'libtirpc' 'libtirpc-compat')
options=('strip')
#source=("$pkgname.tar.gz::https://sourceforge.net/projects/rsf/files/madagascar/madagascar-3.0/madagascar-3.0.1.tar.gz/download")
source=($pkgname::git+https://github.com/ahay/src)
noextract=("$pkgname.tar.gz")

pkgver(){
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd ${srcdir}/${pkgname}
  # Investigate additional bindings
  #export LINKFLAGS="-ltirpc"
  export LINKFLAGS="-llapack -lblas -ltirpc -pthread -fopenmp"
  ./configure --prefix=${pkgdir}/usr/

  echo "Fixing paths in files..."

#  for f in config.py env.sh env.csh ; do
#    sed -i "s|${pkgdir}||g" "$f"
#    sed -i "s|${srcdir}|/usr/src/|g" "$f"
#  done

  sed -i "s/^LINKFLAGS.*/LINKFLAGS = ['-llapack', '-lblas', '-pthread', '-fopenmp', '-ltirpc']/g" config.py
#  sed -i "s/^CXXFLAGS.*/CXXFLAGS = \'-O2 -std=c++11 -U__STRICT_ANSI__ -Wall -pedantic -fopenmp ${CXXFLAGS}\'/g" config.py
  make "${MAKEFLAGS}"
}

package() {
    cd ${srcdir}/${pkgname}
    make install
    mkdir -p "${pkgdir}/usr/src/"
    cp -r ${srcdir}/* ${pkgdir}/usr/src/${pkgname}
    arr[0]="/usr/share/madagascar/etc/config.py"
    arr[1]="/usr/lib/python3.8/site-packages/rsf/prog.py"
    arr[2]="/usr/share/madagascar/etc/env.sh"
    arr[3]="/usr/src/madagascar/config.py"
    echo ${pkgdir}
    echo ${srcdir}
    for f in ${arr[@]} ; do
      sed -i "s|${pkgdir}||g" "${pkgdir}/$f"
      sed -i "s|${srcdir}|/usr/src/|g" "${pkgdir}/$f"
    done
    #rm ${pkgdir}/usr/src/${pkgname}/madagascar.tar.gz
}
md5sums=('SKIP')
