# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=sangnom
pkgname=vapoursynth-plugin-${_plug}-hg
pkgver=40.5a00bb64258d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (HG version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=173752'
license=('MIT')
depends=('vapoursynth')
makedepends=('mercurial')
provides=("vapoursynth-plugin-${_plug}"
          "vapoursynth-plugin-${_plug}-git"
          )
conflicts=("vapoursynth-plugin-${_plug}"
           "vapoursynth-plugin-${_plug}-git"
           )
source=("${_plug}::hg+https://bitbucket.org/James1201/vapoursynth-sangnom")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(hg log -r -1 --template '{rev}.{node|short}\n')"
}

prepare() {
  mkdir -p build

  cd "${_plug}"
  chmod +x autogen.sh
  ./autogen.sh
}

build() {
  cd build
  ../"${_plug}"/configure \
    --libdir="/usr/lib/vapoursynth"

  make
}

package(){

  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
