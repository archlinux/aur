# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=rmlui
pkgname=${_pkgname}-git
pkgver=4.3+28+g48aacadd
pkgrel=1
pkgdesc="The HTML/CSS User Interface library evolved (git checkout)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://mikke89.github.io/RmlUiDoc/"
license=('MIT')
depends=('boost-libs' 'freetype2' 'libgl' 'glu')
makedepends=('cmake' 'mesa' 'boost' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=("${_pkgname}"::git+https://github.com/mikke89/RmlUi.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s/^v//;s/-/+/g"
}

prepare() {
  cd "${_pkgname}"
  [ -d build ] && rm -fr build
  mkdir build
}
  
build() {
  cd "${_pkgname}"/build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR=/usr/lib -DBUILD_SAMPLES=OFF ..
  make
}

package() {
  cd "${_pkgname}"
  make -C build install DESTDIR="${pkgdir}"

  # license
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${_pkgname}"/LICENSE
}
