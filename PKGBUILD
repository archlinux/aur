# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tivtc
pkgname=avisynth-plugin-${_plug}-git
pkgver=r257.94eb799
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=182032'
license=('LGPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/TIVTC.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/include/"{avs*,avi*}
}

build() {
  cd build

  cmake "../${_plug}/src" \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make

#   cd ..
#   g++ -fpic ${CXXLAGS} ${CPPFLAGS} -o RetreiveRanges "${_plug}/Retreive Ranges/RetrieveRanges.cpp"
}

package(){
  make -C build DESTDIR="${pkgdir}" install

#   install -Dm755 RetreiveRanges "${pkgdir}/usr/bin/RetreiveRanges"
#   install -Dm644 "${_plug}/Retreive Ranges/RetrieveRanges-ReadMe.txt" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/RetrieveRanges-ReadMe.txt"

  install -Dm644 "${_plug}/Doc_TDeint/tdeint.htm" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/TDeint/tdeint.htm"

  for i in "${_plug}/Doc_TIVTC/"*.txt; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/TIVTC/$(basename "${i}")"
  done
}
