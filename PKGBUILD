# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsfilterscript
pkgname=vapoursynth-lib-${_plug}-git
pkgver=r119.fc6f2fc
pkgrel=1
pkgdesc="Library for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=181027'
license=('GPL')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-lib-${_plug}")
conflicts=("vapoursynth-lib-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/vsFilterScript.git#branch=stable")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  sed 's|share/|share/vapoursynth/libs/|g' -i "${_plug}/meson.build"
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --prefix /usr \
    -D install_examples=true

  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
