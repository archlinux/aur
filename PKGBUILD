# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=knlmeanscl
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.5.6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171379'
license=('GPL')
depends=('vapoursynth' 'libcl')
makedepends=('git' 'opencl-headers')
source=("https://dl.dropboxusercontent.com/u/6596386/vapoursynth-plugins/KNLMeansCL_v${pkgver}.zip"
        'patch_h.patch::http://sl1pkn07.wtf/paste/view/raw/200696c6'
        'patch_cpp.patch::http://sl1pkn07.wtf/paste/view/raw/00c87ed0')
sha1sums=('f65272737926d6227596eec6ca02918c943633c5'
          'c36e70bc1b2fe98e07c5c4afe8007b2c2a71676e'
          'ac7f7b3c5cd13ed348c823e36b85670f3d5f4393')

prepare() {
  (cd KNLMeansCL/src; find -type f -exec perl -pi -e 's/\r\n?/\n/g' "{}" \;)
  patch -d KNLMeansCL -p0 -i ../patch_h.patch
  patch -d KNLMeansCL -p0 -i ../patch_cpp.patch

#   rm -fr KNLMeansCL/src/VapourSynth.h
#   rm -fr KNLMeansCL/src/VSHelper.h
#   sed -e 's|"VapourSynth.h"|<vapoursynth/VapourSynth.h>|g' \
#       -e 's|"VSHelper.h"|<vapoursynth/VapourSynth.h>|g' \
#       -i KNLMeansCL/src/KNLMeansCL.h

  echo "all:
	g++ -o lib${_plug}.so ${CXXFLAGS} ${CPPFLAGS} ${LDFLAGS} "$(pkg-config --cflags vapoursynth)" KNLMeansCL/src/KNLMeansCL.cpp -std=c++11 -fPIC -shared -lOpenCL" > Makefile
}

build() {
  make
}

package(){
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 KNLMeansCL/README.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.txt"
}
