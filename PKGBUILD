# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot -de>

_pkgname=geonkick
pkgname="${_pkgname}-git"
pkgver=1.6.1.r510.96f8bd7
pkgrel=1
pkgdesc="A free software percussion synthesizer (git version)"
arch=('i386' 'x86_64')
url="http://quamplex.com/geonkick"
license=('GPL3')
groups=('pro-audio')
depends=('cairo' 'desktop-file-utils' 'hicolor-icon-theme' 'libsndfile' 'shared-mime-info')
makedepends=('cmake' 'jack' 'lv2' 'rapidjson' 'redkite' 'sord')
optdepends=('jack: for stand-alone application')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.com/quamplex/geonkick.git")
sha512sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(grep 'geonkick VERSION' CMakeLists.txt | cut -d ' ' -f 3 | tr -d ')')"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # fix ignored CMAKE_INSTALL_PREFIX for redkite include directory
  sed -i -e 's|/usr/local|${CMAKE_INSTALL_PREFIX}|' CMakeLists.txt
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  (
    cd build
    make DESTDIR="$pkgdir/" install
  )
  install -vDm 644 "data/${_pkgname}.desktop" \
    -t "${pkgdir}/usr/share/applications"
  install -vDm 644 examples/* \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
