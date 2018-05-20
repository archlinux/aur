# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=d2vsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.1.4.g5b5e587
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://forum.doom9.org/showthread.php?t=166399"
license=('LGPL2.1')
depends=('vapoursynth'
         'libavutil.so'
         'libavformat.so'
         'libavcodec.so'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/dwbuiten/${_plug}.git"
        'ffmpeg4.patch'
        )
sha256sums=('SKIP'
            'fe0cc3859a6e30e8bde4d79e78adbc5f315628cdfcc46abb9c38825674009183'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  patch -d "${_plug}" -p1 -i "${srcdir}/ffmpeg4.patch"

  cd "${_plug}"
  ./autogen.sh

  cd ../build
  ../"${_plug}"/configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

}

build() {
  make -C build
}

package(){
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 "${_plug}/README" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}

