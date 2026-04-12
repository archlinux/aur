# Maintainer: quietvoid <tcChlisop0@gmail.com>

_plug=fpng
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r13.0a5ac6b
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Mikewando/vsfpng'
license=('LGPL')
depends=('vapoursynth')
makedepends=('git' 'meson-python')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Mikewando/vsfpng.git"
  '0001-Add-R73-compatibility-build-option.patch')
b2sums=(
  'SKIP'
  'f286611f00604b40350f8ec9437cb0377eb4d72319b1228c5ce802fb3756335e683c1a62863923ffa695eae43fe4056e1a9a8cab4245e7c2e55437b59072a4b3'
)

pkgver() {
  cd "${_plug}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"

  git apply "${srcdir}/0001-Add-R73-compatibility-build-option.patch"
}

build() {
  cd "${_plug}"

  arch-meson build -Dr73-compat=true
  meson compile -C build
}

package(){
  cd "${_plug}"

  meson install -C build --destdir "$pkgdir"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
