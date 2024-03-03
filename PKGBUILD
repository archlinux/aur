# Contributor: anon at sansorgan.es
# Contributor: Yingchang Liu
pkgname=madagascar-git
pkgver=r15675.c0a0b1a5d
pkgrel=1
pkgdesc="Multidimensional data analysis and reproducible computational experiments."
url="https://www.reproducibility.org/wiki/Main_Page"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libtirpc' 'ffmpeg' 'libxaw' 'cairo' 'fftw' 'netpbm' 'gd' 'swig' 'python-numpy'
	 'openmpi' 'glu' 'freeglut' 'suitesparse' 'cblas' 'scons' 'plplot') 
optdepends=('cuda: for nvcc, but not compatible with cuda12')
options=('strip')
_pkgname=${pkgname%-git}
source=($_pkgname::git+https://github.com/ahay/src)
# source=($pkgname::git+https://github.com/ahay/src)
md5sums=('SKIP')
provides=('madagascar')
conflicts=('madagascar')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p ${srcdir}/${_pkgname}
  cd ${srcdir}/${_pkgname}
  export RSFROOT=${pkgdir}/opt/${_pkgname}
  # hide hwang's src which can not be compiled.
  mv ./user/hwang ./user/.hwang
  
  ./configure API=c++,f90 --prefix=${RSFROOT}
  make
}

package() {
    export RSFROOT=${pkgdir}/opt/${_pkgname}
    mkdir -p ${RSFROOT}/bin/
    export PATH=${RSFROOT}/bin:$PATH
    cd ${srcdir}/${_pkgname}
    make install
    mv ./user/.hwang ./user/hwang
    
    cp -r ${srcdir}/${_pkgname} ${RSFROOT}/src
    rm -r ${RSFROOT}/src/.git 
   
    chmod a+w ${RSFROOT}/share/madagascar
    # add a symlink to rsfcodes in /opt, so that it can be compiled by user
    # ln -s ${srcdir}/${_pkgname} ${RSFROOT}/rsfcodes
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
      sed -i "s|${srcdir}/${_pkgname}|/opt/${_pkgname}/src|g" "${RSFROOT}/$f"
    done

    install install -dm755 "$pkgdir/usr/share/licenses/$_pkgname" 
    install -m644 COPYING.txt "$pkgdir/usr/share/licenses/$_pkgname/COPYING.txt"
    install -dm755 "$pkgdir/etc/profile.d"
    cat > "$pkgdir/etc/profile.d/${_pkgname}.sh" << EOF
#!/bin/sh
source /opt/${_pkgname}/share/madagascar/etc/env.sh
EOF
    cat > "$pkgdir/etc/profile.d/${_pkgname}.csh" << EOF
#!/bin/csh
source /opt/${_pkgname}/share/madagascar/etc/env.csh
EOF
    chmod 644 "$pkgdir/etc/profile.d/${_pkgname}"{.sh,.csh}
}
