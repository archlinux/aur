# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsrawsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=20191105.0.g82400b7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=166075'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/HolyWu/${_plug}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}


package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
