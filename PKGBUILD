# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
# Contributor: Sigvald Marholm <marholm@marebakken.com>
# Contributor: G S Voelker <voelker@mailbox.org>
# Contributor: Andreas Bilke <abilke@cosy.sbg.ac.at>
# Contributor: Myles English <mylesenglish@gmail.com>
# Contributor: Felix Schindler <aur dot felixschindler dot net>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=slepc
pkgver=3.20.1
pkgrel=1
pkgdesc="Scalable library for Eigenvalue problem computations"
arch=('x86_64')
url="https://${pkgname}.upv.es"
license=('custom')
depends=("petsc>=${pkgver::4}")
makedepends=(gcc-fortran cython)
provides=('slepc4py')
install=slepc.install
source=(${url}/download/distrib/${pkgname}-${pkgver/_/-}.tar.gz)
md5sums=('f052a9a1f7f1378952846bf6375be5bd')

# export MAKEFLAGS="-j1"

build() {
  # get SLEPC_DIR
  source /etc/profile.d/petsc.sh # gets PETSC_DIR

  _build_dir=${srcdir}/${pkgname}-${pkgver/_/-}
  _install_dir=/opt/slepc/$(basename ${PETSC_DIR})

  cd ${_build_dir}

  unset PETSC_ARCH
  export SLEPC_DIR=${_build_dir}

  python ./configure --prefix=${pkgdir}${_install_dir} \
    --with-clean \
    --with-slepc4py=1
  make
}

package() {
  # get SLEPC_DIR
  source /etc/profile.d/petsc.sh # gets PETSC_DIR

  _build_dir=${srcdir}/${pkgname}-${pkgver/_/-}
  _install_dir=/opt/slepc/$(basename ${PETSC_DIR})
  _dest_dir=${pkgdir}${_install_dir}

  cd ${_build_dir}
  export SLEPC_DIR=${_build_dir}
  source /etc/profile.d/petsc.sh # sets PETSC_DIR

  make install >/dev/null # redirect in order to suppress confusing messages

  export SLEPC_DIR=${_install_dir}
  unset PETSC_ARCH

  sed -i "s#${pkgdir}##g" "${_dest_dir}/include/slepcconf.h"
  sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/pkgconfig/slepc.pc"
  sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/modules/${pkgname}/${pkgver}"
  sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepc_rules"
  sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepc_variables"
  # sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepcrules"
  sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepcvariables"
  sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/uninstall.py"
  sed -i "s#${_build_dir}#${_install_dir}#g" "${_dest_dir}/lib/slepc/conf/uninstall.py"

  # remove logs containing references to the build dir
  rm -f "${_dest_dir}/lib/slepc/conf/configure.log"
  rm -f "${_dest_dir}/lib/slepc/conf/make.log"

  # install licence (even though there is no such word as licenses)
  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
  cp ${_build_dir}/LICENSE.md ${pkgdir}/usr/share/licenses/$pkgname/

  mkdir -p ${pkgdir}/etc/profile.d
  echo "export SLEPC_DIR=${_install_dir}" >${pkgdir}/etc/profile.d/slepc.sh
  echo export PYTHONPATH=${_install_dir}/lib:'${PYTHONPATH}' >>${pkgdir}/etc/profile.d/slepc.sh
  chmod +x ${pkgdir}/etc/profile.d/slepc.sh

  # show where the shared libraries are
  install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
  echo "${_install_dir}/lib" >"${pkgdir}"/etc/ld.so.conf.d/slepc.conf
}
