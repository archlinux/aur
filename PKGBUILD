# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsxx
pkgname=vapoursynth-devel-${_plug}-git
pkgver=r52.de38f0e
pkgrel=1
pkgdesc="Development stack for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/sekrit-twc/vsxx'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
optdepends=('bash: for build the exaple')
provides=("vapoursynth-devel-${_plug}")
conflicts=("vapoursynth-devel-${_plug}")
source=("${_plug}::git+https://github.com/sekrit-twc/vsxx.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"
  sed -e 's|VapourSynth|$(pkg-config --cflags vapoursynth)|g' \
      -e 's|-lvapoursynth-script|$(pkg-config --cflags vapoursynth-script)|g' \
      -i README.sh
}

package() {
  cd "${_plug}"
  mkdir -p "${pkgdir}/usr/include/vapoursynth"
  for i in VapourSynth*++.hpp; do
    install -Dm644 "${i}" "${pkgdir}/usr/include/vapoursynth/${i}"
  done

  install -Dm755 README.sh "${pkgdir}/usr/share/doc/vapoursynth/development/${_plug}/README.sh"
  install -Dm644 vsxx_pluginmain.h "${pkgdir}/usr/share/doc/vapoursynth/development/${_plug}/vsxx_pluginmain.h"
  install -Dm644 vsxx_pluginmain.cpp "${pkgdir}/usr/share/doc/vapoursynth/development/${_plug}/vsxx_pluginmain.cpp"
  install -Dm644 vsxx4_pluginmain.h "${pkgdir}/usr/share/doc/vapoursynth/development/${_plug}/vsxx4_pluginmain.h"
  install -Dm644 vsxx4_pluginmain.cpp "${pkgdir}/usr/share/doc/vapoursynth/development/${_plug}/vsxx4_pluginmain.cpp"
  for i in example/*; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/vapoursynth/development/${_plug}/${i}"
  done
  install -Dm644 COPYING.LGPLv2.1 "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LGPLv2.1"
}
