# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=knlmeanscl
pkgbase="foosynth-plugin-${_plug}-git"
pkgname=("avisynth-plugin-${_plug}-git"
         "vapoursynth-plugin-${_plug}-git"
        )
pkgver=1.1.1.r571.c4af339
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=171379'
license=('GPL3')
depends=('opencl-icd-loader')
makedepends=('git'
             'opencl-headers'
             'meson'
             'boost'
             'vapoursynth'
             'avisynthplus'
             )
conflicts=("vapoursynth-plugin-${_plug}")
provides=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/KNLMeansCL.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  _ver="$(cat KNLMeansCL/NLMDefault.h | grep -m1 '#define VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --buildtype=release

  ninja
}

package_avisynth-plugin-knlmeanscl-git() {
  pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
  depends+=('avisynthplus')
  provides=("avisynth-plugin-${_plug}")
  conflicts=("avisynth-plugin-${_plug}")

  install -Dm755 build/libknlmeanscl.so "${pkgdir}/usr/lib/avisynth/libknlmeanscl.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_vapoursynth-plugin-knlmeanscl-git() {
  pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
  depends+=('vapoursynth')
  provides=("vapoursynth-plugin-${_plug}")
  conflicts=("vapoursynth-plugin-${_plug}")

  install -Dm755 build/libknlmeanscl.so "${pkgdir}/usr/lib/vapoursynth/libknlmeanscl.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

