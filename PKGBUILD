# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=reconstruct
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.1.0.0.g36eec61
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Irrational-Encoding-Wizardry/vapoursynth-reconstruct.git'
license=('GPL')
depends=(
  'vapoursynth'
  'gcc-libs'
  'glibc'
)
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vapoursynth-reconstruct.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
#   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export CXXFLAGS="${CXXFLAGS/-march=x86-64 -mtune=generic/-march=native}"

  cd "${_plug}"

  sed '12a#include <string>' -i recon.cpp

  echo "all:
	  g++ -c -std=c++17 -I./kernel $(pkg-config --cflags vapoursynth) ${CXXFLAGS} ${CPPFLAGS} -fPIC  -o kernel/cpufeatures.o kernel/cpufeatures.cpp
	  g++ -c -std=c++17 -I./kernel $(pkg-config --cflags vapoursynth) ${CXXFLAGS} ${CPPFLAGS} -fPIC  -o kernel/cpulevel.o kernel/cpulevel.cpp

	  g++ -c -std=c++17 -I. $(pkg-config --cflags vapoursynth) ${CXXFLAGS} ${CPPFLAGS} -fPIC -o recon.o recon.cpp

	  g++ -std=c++17 -shared -o libvs${_plug}.so kernel/*.o *.o $(pkg-config --libs vapoursynth) ${CXXFLAGS} ${CPPFLAGS} ${LDFLAGS}"> Makefile
}

build() {
  make -C "${_plug}"
}

package() {
  install -Dm755 "${_plug}/libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"
}
