# Maintainer:  arch1t3cht <arch1t3cht@gmail.com>

_plug=descale
pkgname=vapoursynth-plugin-${_plug}-jet-git
pkgver=9.6.geb53b25
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}, JET fork (GIT version)"
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vapoursynth-descale.git'
license=('MIT')
depends=('vapoursynth')
makedepends=(
  'git'
  'meson'
)
provides=(
  "vapoursynth-plugin-${_plug}"
  "vapoursynth-plugin-${_plug}-git"
)
conflicts=(
  "vapoursynth-plugin-${_plug}"
  "vapoursynth-plugin-${_plug}-git"
)
source=("${_plug}::git+https://github.com/Jaded-Encoding-Thaumaturgy/vapoursynth-descale.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth \
    --buildtype release

  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  cd "${_plug}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
