# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=resize2
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r17.6a23fe4
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vapoursynth-resize2'
license=('LGPL')
depends=('vapoursynth' 'zimg')
makedepends=('git' 'meson' 'ninja')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Jaded-Encoding-Thaumaturgy/vapoursynth-resize2.git#commit=6a23fe401b971a5f86c25c64622b899835fd4c03"
  "zimg::git+https://bitbucket.org/the-sekrit-twc/zimg.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${_plug}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd zimg
  git submodule update --init --recursive
  cd "../${_plug}"
  rm -f zimg
  ln -s ../zimg zimg
  # The build script hardcodes -static and a local vapoursynth include dir,
  # but -static builds for this fail on Arch, and we want to use the system vapoursynth
  sed -i "s|link_args: \['-static'],|#link_args: \['-static'],|" meson.build
  sed -i "s|include_directories('vapoursynth/include'),|#include_directories('vapoursynth/include'),|" meson.build
  cp zimg.patch ./zimg
  git -C zimg apply zimg.patch
  arch-meson build \
    --buildtype=release \
    --libdir /usr/lib/vapoursynth
}

build() {
  cd "${_plug}"
  meson compile -C build
}

package() {
  cd "${_plug}"
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 ReadMe.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
