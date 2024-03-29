# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vscomplexpr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r49.3248547
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Irrational-Encoding-Wizardry/vapoursynth-complexpr.git'
license=('MIT')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vapoursynth-complexpr.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - . | tr -d r)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"

  rm -fr kernel/VapourSynth3.h
  sed -e 's|"VapourSynth4.h"|<VapourSynth4.h>|g' \
      -e 's|"VSHelper4.h"|<VSHelper4.h>|g' \
      -i exprdebug.cpp \
      -i exprfilter.cpp \
      -i plugin.h \
      -i kernel/cpulevel.cpp \
      -i expr/expr.cpp \
      -i expr/interpreter.h
  sed 's|VSPresetFormat|VSPresetVideoFormat|g' -i exprdebug.cpp

  echo "all:
	  g++ -shared -std=c++17 -lstdc++ -Wall -fPIC ${CFLAGS} ${CPPFLAGS} -Ofast -flto -fno-signed-zeros -fno-trapping-math -frename-registers -fopenmp -D_GLIBCXX_PARALLEL -D M_PI=3.141592653589793f -D VS_TARGET_CPU_X86 -Wregister -Wno-ignored-attributes -I. -I./expr -I./kernel $(pkg-config --cflags vapoursynth) -o plugin.o plugin.cpp
	  g++ -shared -std=c++17 -lstdc++ -Wall -fPIC ${CFLAGS} ${CPPFLAGS} -Ofast -flto -fno-signed-zeros -fno-trapping-math -frename-registers -fopenmp -D_GLIBCXX_PARALLEL -D M_PI=3.141592653589793f -D VS_TARGET_CPU_X86 -Wregister -Wno-ignored-attributes -I. -I./expr -I./kernel $(pkg-config --cflags vapoursynth) -o exprfilter.o exprfilter.cpp
	  g++ -shared -std=c++17 -lstdc++ -Wall -fPIC ${CFLAGS} ${CPPFLAGS} -Ofast -flto -fno-signed-zeros -fno-trapping-math -frename-registers -fopenmp -D_GLIBCXX_PARALLEL -D M_PI=3.141592653589793f -D VS_TARGET_CPU_X86 -Wregister -Wno-ignored-attributes -I. -I./expr -I./kernel $(pkg-config --cflags vapoursynth) -o exprdebug.o exprdebug.cpp
	  g++ -shared -std=c++17 -lstdc++ -Wall -fPIC ${CFLAGS} ${CPPFLAGS} -Ofast -flto -fno-signed-zeros -fno-trapping-math -frename-registers -fopenmp -D_GLIBCXX_PARALLEL -D M_PI=3.141592653589793f -D VS_TARGET_CPU_X86 -Wregister -Wno-ignored-attributes -I. -I./expr -I./kernel $(pkg-config --cflags vapoursynth) -o expr/expr.o expr/expr.cpp
	  g++ -shared -std=c++17 -lstdc++ -Wall -fPIC ${CFLAGS} ${CPPFLAGS} -Ofast -flto -fno-signed-zeros -fno-trapping-math -frename-registers -fopenmp -D_GLIBCXX_PARALLEL -D M_PI=3.141592653589793f -D VS_TARGET_CPU_X86 -Wregister -Wno-ignored-attributes -I. -I./expr -I./kernel $(pkg-config --cflags vapoursynth) -o expr/interpreter.o expr/interpreter.cpp
	  g++ -shared -std=c++17 -lstdc++ -Wall -fPIC ${CFLAGS} ${CPPFLAGS} -Ofast -flto -fno-signed-zeros -fno-trapping-math -frename-registers -fopenmp -D_GLIBCXX_PARALLEL -D M_PI=3.141592653589793f -D VS_TARGET_CPU_X86 -Wregister -Wno-ignored-attributes -I. -I./expr -I./kernel $(pkg-config --cflags vapoursynth) -o expr/jitcompiler_x86.o expr/jitcompiler_x86.cpp
	  g++ -shared -std=c++17 -lstdc++ -Wall -fPIC ${CFLAGS} ${CPPFLAGS} -Ofast -flto -fno-signed-zeros -fno-trapping-math -frename-registers -fopenmp -D_GLIBCXX_PARALLEL -D M_PI=3.141592653589793f -D VS_TARGET_CPU_X86 -Wregister -Wno-ignored-attributes -I. -I./expr -I./kernel $(pkg-config --cflags vapoursynth) -o expr/jitcompiler.o expr/jitcompiler.cpp
	  g++ -shared -std=c++17 -lstdc++ -Wall -fPIC ${CFLAGS} ${CPPFLAGS} -Ofast -flto -fno-signed-zeros -fno-trapping-math -frename-registers -fopenmp -D_GLIBCXX_PARALLEL -D M_PI=3.141592653589793f -D VS_TARGET_CPU_X86 -Wregister -Wno-ignored-attributes -I. -I./expr -I./kernel $(pkg-config --cflags vapoursynth) -o kernel/cpufeatures.o kernel/cpufeatures.cpp
	  g++ -shared -std=c++17 -lstdc++ -Wall -fPIC ${CFLAGS} ${CPPFLAGS} -Ofast -flto -fno-signed-zeros -fno-trapping-math -frename-registers -fopenmp -D_GLIBCXX_PARALLEL -D M_PI=3.141592653589793f -D VS_TARGET_CPU_X86 -Wregister -Wno-ignored-attributes -I. -I./expr -I./kernel $(pkg-config --cflags vapoursynth) -o kernel/cpulevel.o kernel/cpulevel.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o libvscomplexpr.so plugin.o exprfilter.o exprdebug.o expr/expr.o expr/interpreter.o expr/jitcompiler_x86.o expr/jitcompiler.o kernel/cpulevel.o kernel/cpufeatures.o" > Makefile

}

build() {
  make -C "${_plug}"
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

#   install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
