# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=ocr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.2.gb5dd774
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/vapoursynth/subtext'
license=('MIT')
depends=('vapoursynth'
         'tesseract'
         )
makedepends=('git'
             'meson'
            )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/vapoursynth/vs-ocr.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d R)"
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

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/docs/ocr.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.rst"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
