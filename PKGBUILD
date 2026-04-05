# Maintainer: quietvoid <tcChlisop0@gmail.com>

_plug=fpng
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r7.544029c
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
  '964363a77ffe1c41e24eba4aa256637ed0d877749b8132c06b5f0ac9fb92526878273690deb08b9a2a1165cb0ef2c1276a14656c79a804997908f8d80c078b61'
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
