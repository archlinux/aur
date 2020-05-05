# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot -de>

_pkgname=geonkick
pkgname="${_pkgname}-git"
pkgver=2.1.0.r815.f9b8340
pkgrel=1
pkgdesc="A free software percussion synthesizer (git version)"
arch=('i386' 'x86_64')
url="https://gitlab.com/iurie-sw/geonkick"
license=('GPL3')
groups=('pro-audio' 'lv2-plugins')
depends=('cairo' 'desktop-file-utils' 'hicolor-icon-theme' 'libsndfile' 'shared-mime-info')
makedepends=('cmake' 'jack' 'lv2' 'rapidjson' 'redkite' 'sord')
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

prepare() {
  cd "${srcdir}/${_pkgname}/doc/examples"
  # extract drumkits
  for tarxz in *.tar.xz; do
    tar -xvJf "$tarxz"
  done
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
  # example preset & kits
  install -vDm 644 doc/examples/*.{gkick,gkit} \
    -t "${pkgdir}/usr/share/${_pkgname}/presets"
  for directory in doc/examples/*; do
    if [[ -d "$directory" ]]; then
      install -vDm 644 "$directory/"*.{gkick,gkit} \
        -t "${pkgdir}/usr/share/${_pkgname}/presets/$(basename "$directory")"
    fi
  done
  # documentation
  install -vDm 644 README.md NEWS.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
