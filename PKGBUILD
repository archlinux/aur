# Maintainer: anon at sansorgan.es
pkgname=madagascar
pkgver=3.0.1
pkgrel=6
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

prepare() {
	cd "$srcdir"
	#bsdtar -xf $pkgname.tar.gz --strip-components=1
}

build() {
  cd ${srcdir}
  # Investigate additional bindings
  export LINKFLAGS="-ltirpc"
  ./configure --prefix=${pkgdir}/usr/

  echo "Fixing paths in files..."

  for f in config.py env.sh env.csh ; do
    sed -i "s|${pkgdir}||g" "$f"
    sed -i "s|${srcdir}|/usr/src/|g" "$f"
  done

  sed -i "s/^LINKFLAGS.*/LINKFLAGS = ['-pthread', '-fopenmp', '-ltirpc']/g" config.py
  make
}

package() {
    make install
    #sed -i "s.${pkgdir}..g" ${pkgdir}/usr/share/madagascar/etc/env.sh
    #sed -i "s.${pkgdir}..g" ${pkgdir}/usr/share/madagascar/etc/env.csh
    mkdir -p "${pkgdir}/usr/src/"
    cp -r ${srcdir} ${pkgdir}/usr/src/${pkgname}
    rm ${pkgdir}/usr/src/${pkgname}/madagascar.tar.gz
    #rm -rf "${pkgdir}/usr/src/${pkgname}/{pkgname}"
    #rm -rf "${pkgdir}/usr/src/${pkgname}/{pkgdir}"
}
#md5sums=('a87a6f7f5ba552cd251b1588048844bf')
md5sums=('SKIP')
