# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=hyperscan-chimera-static
pkgver=5.4.2
pkgrel=2
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
  cd "${srcdir}/${_folder}"
  rm -rf pcre
  mv ../pcre-master pcre
  # GCC will default functions without return value to int, which is troublesome for us here
  sed -i '33s/main/void main/' cmake/pcre.cmake
  # According to docs, these flags will improve performance in servers but I don't have the processor
  # -DFAT_RUNTIME=on -DBUILD_AVX512=on -DBUILD_AVX512VBMI=on
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DBUILD_CHIMERA=on -DBUILD_STATIC_LIBS=on
  make -j 9
}

package() {
  cd "${srcdir}/${_folder}"
  make DESTDIR="${pkgdir}" install
  # EXTRA DIRTY HACK
  # pcre is not properly being distributed, and it is custombuilt by us, hence let's package it inside the library to avoid
  # _pcre_valid_utf symbol missing
  ####
  cd "${pkgdir}"
  rm -rf tmp
  mkdir tmp
  cd tmp
  ar x "${srcdir}/${_folder}/lib/libchimera.a"
  ar x "${srcdir}/${_folder}/lib/libpcre.a"
  ar cr libchimera.a *.o
  cp libchimera.a ${pkgdir}/usr/lib/libchimera.a
  cd ..
  rm -rf tmp
  ####
  # ANOTHER DIRTY HACK
  # chimera/CMakeLists.txt uses super ugly hack to define what it needs to link to, and libpcre is not really needed
  sed -i '11s/-L.*//' ${pkgdir}/usr/lib/pkgconfig/libch.pc
}
