# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=slepc
pkgver=3.6.3
pkgrel=1
pkgdesc="Scalable library for Eigenvalue problem computations"
arch=('i686' 'x86_64')
url="http://www.grycap.upv.es/slepc"
license=('GNUv3')
depends=('python2' 'gcc' 'gcc-fortran' 'petsc>=3.6.0')
install=slepc.install
source=(http://www.grycap.upv.es/slepc/download/distrib/${pkgname}-${pkgver/_/-}.tar.gz)
md5sums=('673b877e3f386bc8e28e24d14e8246f3')

export MAKEFLAGS="-j1"

build() {
    # get SLEPC_DIR
    source /etc/profile.d/petsc.sh    # gets PETSC_DIR

    _build_dir=${srcdir}/${pkgname}-${pkgver/_/-}
    _install_dir=/opt/slepc/`basename ${PETSC_DIR}`

    cd ${_build_dir}

    unset PETSC_ARCH
    export SLEPC_DIR=${_build_dir}

    python2 ./configure --prefix=${pkgdir}${_install_dir}
#    export PETSC_ARCH=arch-installed-petsc
    make
}


package() {
    # get SLEPC_DIR
    source /etc/profile.d/petsc.sh    # gets PETSC_DIR

    _build_dir=${srcdir}/${pkgname}-${pkgver/_/-}
    _install_dir=/opt/slepc/`basename ${PETSC_DIR}`

    cd ${_build_dir}
 #   export PETSC_ARCH=arch-installed-petsc
    export SLEPC_DIR=${_build_dir}
    source /etc/profile.d/petsc.sh  # sets PETSC_DIR

    make install > /dev/null # redirect in order to suppress confusing messages

    export SLEPC_DIR=${_install_dir}
    unset PETSC_ARCH

    sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/include/slepcconf.h"
    sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/lib/slepc/conf/slepcrules"
    sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/lib/slepc/conf/slepc_rules"
    sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/lib/slepc/conf/slepc_variables"
    sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/lib/slepc/conf/slepcvariables"
    sed -i 's#'"${_build_dir}"'#"${_install_dir}"#g' "${pkgdir}${_install_dir}/lib/slepc/conf/uninstall.py"
    sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/lib/slepc/conf/uninstall.py"
    sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/lib/pkgconfig/SLEPc.pc"
    sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/lib/slepc/conf/modules/${pkgname}/${pkgver}"

    # remove logs containing references to the build dir
    rm -f "${pkgdir}${_install_dir}/lib/slepc/conf/configure.log"
    rm -f "${pkgdir}${_install_dir}/lib/slepc/conf/make.log"

    mkdir -p ${pkgdir}/etc/profile.d
    echo "export SLEPC_DIR=${_install_dir}" > ${pkgdir}/etc/profile.d/slepc.sh
    chmod +x ${pkgdir}/etc/profile.d/slepc.sh

    # show where the shared libraries are
    install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
    echo "${_install_dir}/lib" > "${pkgdir}"/etc/ld.so.conf.d/slepc.conf
}
