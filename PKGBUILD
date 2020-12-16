# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot -de>

_pkgname=geonkick
pkgname="${_pkgname}-git"
pkgver=2.6.0.r1111.8324615
pkgrel=1
pkgdesc="A free software percussion synthesizer (git version)"
arch=('x86_64')
url="https://gitlab.com/iurie-sw/geonkick"
license=('GPL3')
groups=('pro-audio' 'lv2-plugins')
depends=('cairo' 'hicolor-icon-theme' 'libsndfile')
makedepends=('cmake' 'jack' 'lv2' 'rapidjson' 'redkite>=1.3.0' 'sord')
optdepends=('jack: for stand-alone application')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.com/iurie-sw/geonkick.git")
sha512sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(grep 'geonkick VERSION' CMakeLists.txt | cut -d ' ' -f 3 | tr -d ')')"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGKICK_REDKITE_SDK_PATH=/usr \
    ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  (
    cd build
    make DESTDIR="$pkgdir/" install
  )
  # desktop file
  install -vDm 644 "data/${_pkgname}.desktop" \
    -t "${pkgdir}/usr/share/applications"
  # documentation
  install -vDm 644 README.md NEWS.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
