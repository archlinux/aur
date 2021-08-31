# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=dolfin-git
_realname=dolfin
pkgdesc="C++ interface of FEniCS for ordinary and partial differential equations."
pkgver=0.1.0.98.g80461056a6
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/FEniCS/dolfinx"
license=('GPL3')
groups=('fenics-git')
depends=('cppunit' 'eigen' 'scotch' 'gl2ps' 'python-ffc-git' 'petsc' 'python-basix-git' 'petsc4py')
makedepends=('git' 'boost')
options=(!emptydirs)
source=("${_realname}::git+https://github.com/FEniCS/dolfinx.git")
md5sums=('SKIP')
_mainver=$(printf ${pkgver} | cut -d'.' -f1,2,3)
provides=("${_realname}=$_mainver" "python-${_realname}=$_mainver"
          "python-${_realname}-git=$_mainver")
replaces=("${_realname}" "python-${_realname}"
          "python-${_realname}-git")
conflicts=("${_realname}" "python-${_realname}"
           "python-${_realname}-git")


[ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh

pkgver() {
  cd "${srcdir}/${_realname}"
  git describe --tags --match '*.*' | tr '-' '.'
}

build() {
  [ -e /etc/profile.d/slepc.sh ] && [ -n "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

  _buildir="${srcdir}"/"${_realname}"/cpp/build
  [ ! -d "${_buildir}" ] && mkdir "${_buildir}"
  cd "${_buildir}"/

  cmake -DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
        -DCMAKE_BUILD_TYPE="Release" \
        ..
  make
}

package() {
    cd "${_realname}"/cpp/build
    make install DESTDIR="${pkgdir}"

    cd "${srcdir}"/"${_realname}"/python
    python setup.py build
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
