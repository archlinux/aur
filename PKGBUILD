# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

_pkgname=delay-architect
pkgname=${_pkgname}-git
pkgver=r260.20667e6
pkgrel=1
pkgdesc="A visual, musical editor for delay effects "
arch=('i686' 'x86_64')
url="https://github.com/jpcima/DelayArchitect"
license=('BSD2')
depends=('libx11' 'libgl' 'libxext' 'libxrandr' 'libxinerama' 'libxcursor' 'alsa-lib')
makedepends=('git' 'cmake')
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/jpcima/DelayArchitect.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

  # switch to below when tags exist
  # git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${_pkgname}"

  rm -rf build
  mkdir -p build
  cd build
  #  -DCMAKE_BUILD_TYPE=Release
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  # this doesn't work for some reason
  #install -dvDm 644 'DelayArchitect_artefacts/RelWithDebInfo/VST3/Delay Architect.vst3' "${pkgdir}/usr/lib/vst3/"

  mkdir -p "${pkgdir}/usr/lib/vst3"
  cp -r 'DelayArchitect_artefacts/RelWithDebInfo/VST3/Delay Architect.vst3' "${pkgdir}/usr/lib/vst3/"
}
