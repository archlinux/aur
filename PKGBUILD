# Contributor: anon at sansorgan.es
# Contributor: Yingchang Liu
pkgname=madagascar-git
pkgver=r15659.d72996857
pkgrel=2
pkgdesc="Multidimensional data analysis and reproducible computational experiments."
url="https://www.reproducibility.org/wiki/Main_Page"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libtirpc' 'ffmpeg' 'libxaw' 'cairo' 'fftw' 'netpbm' 'gd' 'swig' 'python-numpy'
	 'openmpi' 'glu' 'freeglut' 'suitesparse' 'cblas' 'scons' 'plplot') 
optdepends=('cuda: for nvcc, but not compatible with cuda12')
options=('strip')
source=($pkgname::git+https://github.com/ahay/src)
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p ${srcdir}/${pkgname}
  cd ${srcdir}/${pkgname}
  export RSFROOT=${pkgdir}/opt/${pkgname}
  # hide hwang's src which can not be compiled.
  mv ./user/hwang ./user/.hwang
  
  ./configure API=c++,f90
  make
}

package() {
    export RSFROOT=${pkgdir}/opt/${pkgname}
    mkdir -p ${RSFROOT}/bin/
    export PATH=${RSFROOT}/bin:$PATH
    cd ${srcdir}/${pkgname}
    make install
    
    cp -r ${srcdir}/${pkgname} ${RSFROOT}/src
    rm -r ${RSFROOT}/src/.git 
   
    chmod a+w ${RSFROOT}/share/madagascar
    # add a symlink to rsfcodes in /opt, so that it can be compiled by user
    # ln -s ${srcdir}/${pkgname} ${RSFROOT}/rsfcodes
    # chmod -R 755 ${RSFROOT}/rsfcodes
    
    # fix paths in in files
    arr[0]="/share/madagascar/etc/config.py"
    arr[1]="/share/madagascar/etc/env.sh"
    arr[2]="/share/madagascar/etc/env.csh"
    _python_version=$(ls $RSFROOT/lib | grep python)
    arr[3]="/lib/${_python_version}/site-packages/rsf/prog.py"
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
