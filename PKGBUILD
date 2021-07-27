pkgname=libe57
pkgver=1.1.332
pkgrel=1
pkgdesc='An open source implementation of the ASTM E2807 Standard Specification for 3D Imaging Data Exchange in the C++ language.'
arch=('i686' 'x86_64')
url='http://www.libe57.org/'
license=('custom')
depends=('xerces-c' 'boost-libs' 'icu')
makedepends=()
source=("https://downloads.sourceforge.net/project/e57-3d-imgfmt/E57Refimpl-src/E57RefImpl_src-${pkgver}.zip"
        "build-shared.patch"
        "replace_tr1_with_cpp11.patch")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd "${srcdir}/E57RefImpl_src-${pkgver}"
  patch -Np1 < ../build-shared.patch
  patch -Np1 < ../replace_tr1_with_cpp11.patch

  if [[ -d "${srcdir}/build" ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "${srcdir}/E57RefImpl_src-${pkgver}" -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
