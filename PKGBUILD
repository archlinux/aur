pkgname=ffms2-qyot27-git
pkgver=2.31.0.r1445.70779f9
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
  _ver1="$(cat include/ffms.h | grep -m1 FFMS_VERSION | cut -d ' ' -f3 | tr -d '(' )"
  _ver2="$(cat include/ffms.h | grep -m1 FFMS_VERSION | cut -d '|' -f2 | cut -d '(' -f2 | cut -d '<' -f1 | tr -d ' ')"
  _ver3="$(cat include/ffms.h | grep -m1 FFMS_VERSION | cut -d '|' -f3 | cut -d '(' -f2 | cut -d '<' -f1 | tr -d ' ')"
   echo "${_ver1}.${_ver2}.${_ver3}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  # unbundle
  rm -fr ffms2_cplugin/src/vapoursynth/{VapourSynth,VSHelper}.h

  sed -e 's|"VapourSynth.h"|<vapoursynth/VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<vapoursynth/VSHelper.h>|g' \
      -i ffms2_cplugin/src/vapoursynth/vapoursource.cpp \
      -i ffms2_cplugin/src/vapoursynth/vapoursynth.cpp \
      -i ffms2_cplugin/src/vapoursynth/vapoursource.h
}

build() {
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
  cd ffms2_cplugin
  make DESTDIR="${pkgdir}" install

  install -Dm644 doc/ffms2-api.md "${pkgdir}/usr/share/doc/ffms2/ffms2-api.md"
  install -Dm644 doc/ffms2-changelog.md "${pkgdir}/usr/share/doc/ffms2/ffms2-changelog.md"
  install -Dm644 doc/ffms2-avisynth.md "${pkgdir}/usr/share/doc/avisynth/plugins/ffms2-avisynth.md"
  install -Dm644 doc/ffms2-vapoursynth.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/ffms2-vapoursynth.md"
}
