# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=NiftySeg
pkgname=niftyseg-git
_pkgver=1.0
pkgver=1.0.r331.2782377
pkgrel=1
pkgdesc='Programs to perform EM based segmentation of images in nifti or analyse format'
arch=('x86_64')
url='https://github.com/KCL-BMEIS/NiftySeg'
license=('BSD')
depends=(
  'bash'
  'eigen'
  'zlib'
)
makedepends=(
  'cmake'
  'doxygen'
  'git'
)
provides=(niftyseg=${pkgver})
conflicts=(niftyseg)
source=("${_pkgname}::git+https://github.com/KCL-BMEIS/NiftySeg.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ver=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "${_pkgver}.${ver}"
}

prepare() {
  rm -rf build
  mkdir build
}

build() {
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_Z:BOOL=OFF \
    "${srcdir}/${_pkgname}"
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/${pkgname}"
  mv -v "${pkgdir}/usr/priors" "${pkgdir}/usr/share/${pkgname}/priors"
}
# vim:set ts=2 sw=2 et:

