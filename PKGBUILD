# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=hyperscan-chimera-static
pkgver=5.4.2
pkgrel=1
pkgdesc="Hyperscan Intel library with chimera support"
url="https://intel.github.io/hyperscan/dev-reference/chimera.html#requirements"
arch=('x86_64')
license=('BSD')
depends=()
makedepends=('make' 'cmake' 'ragel' 'boost')
_folder=hyperscan-${pkgver}
source=("${_folder}.tar.gz::https://github.com/intel/hyperscan/archive/refs/tags/v5.4.2.tar.gz"
"pcre-master.tar.gz::https://codeload.github.com/luvit/pcre/tar.gz/refs/heads/master")
md5sums=('202f4b42f5dd4a7bb2506445e51a33b9'
         '48e5650e780178c7e6c23e98277538d8')
options=(!lto staticlibs)

build() {
  echo "${srcdir}/${_folder}"
  cd "${srcdir}/${_folder}"
  rm -rf pcre
  mv ../pcre-master pcre
  # According to docs, these flags will improve performance in servers but I don't have the processor
  # -DFAT_RUNTIME=on -DBUILD_AVX512=on -DBUILD_AVX512VBMI=on
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DBUILD_CHIMERA=on -DBUILD_STATIC_LIBS=on
  make -j 9
}

package() {
  cd "${srcdir}/${_folder}"
  make DESTDIR="${pkgdir}" install
}
