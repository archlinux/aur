pkgname=ffms2-qyot27-git
pkgver=2.18.742.g67d5ca7
pkgrel=1
pkgdesc="An FFmpeg/Libav based source library and Avisynth/Vapoursynth plugin for easy frame accurate access. (GIT version) (Qyot27 fork)"
url='https://github.com/FFMS/ffms2'
arch=('x86_64')
license=('GPL')
depends=('libavformat.so'
         'libavcodec.so'
         'libswscale.so'
         'libavutil.so'
         'avisynthplus'
         'vapoursynth'
         )
makedepends=('git')
provides=('ffms2'
          'libffms2.so'
          'vapoursynth-plugin-ffms2'
          'vapoursynth-plugin-ffms2-git'
          'avisynth-plugin-ffms2'
          'avisynth-plugin-ffms2-git'
          )
conflicts=('ffms2')
source=('git+https://github.com/qyot27/ffms2_cplugin.git#branch=patches_plusvp9av1')
sha256sums=('SKIP')

pkgver() {
  cd ffms2_cplugin
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {

  rm -fr ffms2_cplugin/src/vapoursynth/{VapourSynth,VSHelper}.h

  sed 's|"VapourSynth.h"|<vapoursynth/VapourSynth.h>|g' -i ffms2_cplugin/src/vapoursynth/vapoursource.h
  sed 's|"VSHelper.h"|<vapoursynth/VSHelper.h>|g' \
    -i ffms2_cplugin/src/vapoursynth/vapoursource.cpp \
    -i ffms2_cplugin/src/vapoursynth/vapoursynth.cpp
}

build() {
  export LC_ALL=C
  cd ffms2_cplugin
  ./configure \
    --prefix=/usr \
    --enable-shared \
    --enable-pic \
    --enable-avisynth-cpp \
    --enable-vapoursynth

  make
}

package() {
  make -C ffms2_cplugin DESTDIR="${pkgdir}" install
}
