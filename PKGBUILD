# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

_plug=subtext
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R2.2.g8ae5ba2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/vapoursynth/subtext'
license=('MIT')
depends=('vapoursynth'
  'libass'
  'ffmpeg'
)
makedepends=('git'
  'meson'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/vapoursynth/subtext.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" --libdir /usr/lib/vapoursynth
  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/docs/subtext.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.rst"
}
