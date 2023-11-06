# Contributor: anon at sansorgan.es

pkgname=madagascar
pkgver=r15659.d72996857
pkgrel=1
pkgdesc="Multidimensional data analysis and reproducible computational experiments."
url="https://www.reproducibility.org/wiki/Main_Page"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libtirpc' 'ffmpeg' 'libxaw' 'cairo' 'fftw' 'netpbm' 'gd'
	 'openmpi' 'glu' 'freeglut' 'suitesparse') 
makedepends=('libtirpc' 'libtirpc' 'scons')
options=('strip')
source=($pkgname::git+https://github.com/ahay/src)
md5sums=('SKIP')
noextract=("$pkgname.tar.gz")

pkgver(){
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}

  mkdir -p ${srcdir}/bin/
  export PATH=${srcdir}/bin:$PATH

  export LINKFLAGS="-llapack -lblas -ltirpc -pthread -fopenmp"
  ./configure --prefix=${pkgdir}/usr/

  echo "Fixing paths in files..."

  sed -i "s/^LINKFLAGS.*/LINKFLAGS = ['-llapack', '-lblas', '-pthread', '-fopenmp', '-ltirpc']/g" config.py
  make "${MAKEFLAGS}"
}

package() {
    cd ${srcdir}/${pkgname}
    make install
    mkdir -p "${pkgdir}/usr/src/${pkgname}"
    cp -r ${srcdir}/${pkgname}/* ${pkgdir}/usr/src/${pkgname}
    arr[0]="usr/share/madagascar/etc/config.py"
    arr[1]="usr/lib/python3.11/site-packages/rsf/prog.py"
    arr[2]="usr/share/madagascar/etc/env.sh"
    arr[3]="usr/src/madagascar/config.py"
    echo ${pkgdir}
    echo ${srcdir}
    for f in ${arr[@]} ; do
      sed -i "s|${pkgdir}||g" "${pkgdir}/$f"
      sed -i "s|${srcdir}|/usr/src/|g" "${pkgdir}/$f"
    done
}
