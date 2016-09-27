# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dctfilter
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r3.0.gf81f4d4
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171039'
license=('MIT')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://bitbucket.org/mystery_keeper/vapoursynth-dctfilter.git"
        'https://raw.githubusercontent.com/VFR-maniac/VapourSynth-DCTFilter/master/GNUmakefile'
        'https://raw.githubusercontent.com/VFR-maniac/VapourSynth-DCTFilter/master/configure'
        )
sha1sums=('SKIP'
          '4637a944ec0e010e023aa2dfa68b23bb0f00bb58'
          '06bffb9bf75132918a0d31f5f52d8667ac021886'
          )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  cp "${srcdir}/GNUmakefile" .
  cp "${srcdir}/configure" .
  chmod +x configure
}

build() {
  cd "${_plug}"
  ./configure \
    --prefix=/usr \
    --extra-cflags="${CFLAGS} $(pkg-config --cflags vapoursynth)" \
    --extra-ldflags="${LDFLAGS}"
  make
}

package() {
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
