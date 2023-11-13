# Contributor: anon at sansorgan.es

pkgname=madagascar
pkgver=4.0.1
pkgrel=2
pkgdesc="Multidimensional data analysis and reproducible computational experiments."
url="https://www.reproducibility.org/wiki/Main_Page"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libtirpc' 'ffmpeg' 'libxaw' 'cairo' 'fftw' 'netpbm' 'gd' 'scons'
	 'openmpi' 'glu' 'freeglut' 'suitesparse' 'python-numpy' 'swig' 'cblas' 'plplot')
optdepends=('cuda: GPU acceleration, but not compatible with cuda 12')
makedepends=('scons' 'python')
options=('strip')
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/rsf/files/$pkgname/$pkgname-4.0/$pkgname-$pkgver.tar.gz/download")
sha256sums=('91148aabfb27919934651a93d0a33aa90debbd875d615bd20fa92a22001bea4f')
noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
    cd "$srcdir"
    mkdir -p ${srcdir}/${pkgname}
    bsdtar -xf $pkgname-$pkgver.tar.gz --strip-components=1 -C ${srcdir}/${pkgname}
}

build() {
  mkdir -p ${srcdir}/${pkgname}
  cd ${srcdir}/${pkgname}
  export RSFROOT=${pkgdir}/opt/${pkgname}

# fix paths for tirpc in framework/configure.py
  sed -i '430,433c\
    (plat['\''distro'\''\] == '\''centos'\'' and int(plat['\''version'\''\][0]) >= 8) or \\\
    plat['\''distro'\''\] == '\''fedora'\'' or \\\
    plat['\''distro'\''\] == '\''arch'\'' or \\\
    (plat['\''distro'\''\] == '\''ubuntu'\'' and int(plat['\''version'\''\][:2]) >= 20): \ \
        context.env['\''CPPPATH'\''\] = path_get(context,'\''CPPPATH'\'','\''/usr/include/tirpc'\'')' framework/configure.py
    # export LINKFLAGS="-llapack -lblas -ltirpc -pthread -fopenmp"
  ./configure API=c++,f90
    # sed -i "s/^LINKFLAGS.*/LINKFLAGS = ['-llapack', '-lblas', '-pthread', '-fopenmp', '-ltirpc']/g" config.py
    # make "${MAKEFLAGS}"
  make 
}

package() {
    export RSFROOT=${pkgdir}/opt/${pkgname}
    mkdir -p ${RSFROOT}/bin/
    export PATH=${RSFROOT}/bin:$PATH
    cd ${srcdir}/${pkgname}
    make install

    cp -r ${srcdir}/${pkgname} ${RSFROOT}/src
    chmod a+w ${RSFROOT}/share/madagascar
    # add a symlink to rsfcodes in /opt, so that it can be compiled by user
    # ln -s ${srcdir}/${pkgname} ${pkgdir}/opt/${pkgname}/rsfcodes
    # chmod 755 ${pkgdir}/opt/${pkgname}/rsfcodes
# fix paths in in files
    arr[0]="/share/madagascar/etc/config.py"
    arr[1]="/share/madagascar/etc/env.sh"
    arr[2]="/share/madagascar/etc/env.csh"
    python_version=$(ls $RSFROOT/lib | grep python)
    arr[3]="/lib/${python_version}/site-packages/rsf/prog.py"
    arr[4]="/src/config.py"
    arr[5]="/src/env.sh"
    arr[6]="/src/env.csh"
    
    echo ${pkgdir}
    echo ${srcdir}
    for f in ${arr[@]} ; do
      sed -i "s|${pkgdir}||g" "${RSFROOT}/$f"
      sed -i "s|${srcdir}/${pkgname}|/opt/${pkgname}/src|g" "${RSFROOT}/$f"
    done

    install install -dm755 "$pkgdir/usr/share/licenses/$pkgname" 
    install -m644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
    install -dm755 "$pkgdir/etc/profile.d"
    cat > "$pkgdir/etc/profile.d/${pkgname}.sh" << EOF
#!/bin/sh
source /opt/${pkgname}/share/madagascar/etc/env.sh
EOF
    cat > "$pkgdir/etc/profile.d/${pkgname}.csh" << EOF
#!/bin/csh
source /opt/${pkgname}/share/madagascar/etc/env.csh
EOF
    chmod 755 "$pkgdir/etc/profile.d/${pkgname}"{.sh,.csh}
}
