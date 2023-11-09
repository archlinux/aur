# Maintainer: Dominik Wetzel <dimonok at web dot de>

pkgname=clblast-git
_gitname=CLBlast
pkgver=1.6.1.5.gbcd294a9
pkgrel=2
pkgdesc="Tuned OpenCL BLAS library (works with OpenCL 1.1)"
arch=('i686' 'x86_64')
url="https://github.com/CNugteren/CLBlast"
license=('Apache')
depends=("opencl-headers" "ocl-icd")
makedepends=('git' 'cmake')
provides=("clblast")
conflicts=("clblast")
source=("git+https://github.com/CNugteren/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --always --tags | sed -e 's/-/./g' -e 's/v//g'
}

prepare() {
  cd ${_gitname}
  rm -rf _build
  mkdir _build
  cd _build
  cmake .. -DCMAKE_BUILD_TYPE=Release "-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr" "-DNETLIB=ON"
}

build() {
  cd ${_gitname}
  cmake --build ./_build
}

#package() {
#  cd ${_gitname}/_build
#  make install
#}

package() {
  cd ${_gitname}
  cmake --install _build
  #mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
  sed -i "/^prefix=/c\prefix=/usr" "${pkgdir}/usr/lib/pkgconfig/clblast.pc"
#  mkdir "${pkgdir}/usr/include/${_gitname}/"
#  mv -t "${pkgdir}/usr/include/${_gitname}/" "${pkgdir}"/usr/include/*.h
}

