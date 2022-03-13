# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mvtools_sf
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=10_pe.7.g38dadba
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=172525'
license=('GPL2')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git'
             'meson'
             'vapoursynth-lib-vsfilterscript-git'
              )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/vapoursynth-mvtools-sf.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build

  sed 's|vapoursynth-mvtools-sf|mvtools_sf|g' -i "${_plug}/meson.build"
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --prefix /usr

  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
