# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lsmashsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r935.3edd194
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=167435'
license=('LGPL')
depends=('vapoursynth'
         'libavutil.so'
         'libavformat.so'
         'libavcodec.so'
         'libswscale.so'
         'liblsmash.so'
         )
makedepends=('git'
             'libavresample'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/VFR-maniac/L-SMASH-Works.git"
        'patch.patch'
        )
sha256sums=('SKIP'
            'cb9603da5bd264ae5a1917490069d5dd564714bc0bd8aa5c46ad5b7f269170e1'
            )

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"

  rm -fr VapourSynth/VapourSynth.h

  patch --binary -p1 -i "${srcdir}/patch.patch"
}

build() {
  cd "${_plug}/VapourSynth"
  ./configure \
    --prefix=/usr \
    --extra-cflags="${CFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth)" \
    --extra-ldflags="${LDFLAGS}"

  LC_ALL=C make
}

package(){
  cd "${_plug}/VapourSynth"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
