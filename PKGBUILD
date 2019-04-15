# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=removedirtvs
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r78.ddc78e5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=169771'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/handaimaoh/${_plug}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"
  rm -fr VapourSynth.h VSHelper.h

  echo "all:
	  g++ -c -std=gnu++11 -DVS_TARGET_CPU_X86=1 -fpermissive -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o DupBlocks.o DupBlocks.cpp
	  g++ -c -std=gnu++11 -DVS_TARGET_CPU_X86=1 -fpermissive -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o RemoveDirt.o RemoveDirt.cpp
	  g++ -c -std=gnu++11 -DVS_TARGET_CPU_X86=1 -fpermissive -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o RestoreMotionBlocks.o RestoreMotionBlocks.cpp
	  g++ -c -std=gnu++11 -DVS_TARGET_CPU_X86=1 -fpermissive -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o SCSelect.o SCSelect.cpp
	  g++ -c -std=gnu++11 -DVS_TARGET_CPU_X86=1 -fpermissive -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o shared.o shared.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so DupBlocks.o RemoveDirt.o RestoreMotionBlocks.o SCSelect.o shared.o" > Makefile
}

build() {
  cd "${_plug}"
  make
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
