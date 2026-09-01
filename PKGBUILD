# Maintainer: taotieren <admin@taotieren.com>

pkgname=all-logic-git
pkgver=1.4.0.r5.gabaf301
pkgrel=1
pkgdesc='ALL LOGIC is an unofficial multi-vendor logic analyzer host'
arch=($CARCH)
url='https://github.com/Doukeyi-X/ALL-LOGIC'
license=('GPL-3.0-only')
provides=(
  ${pkgname%-git}
  dsview
)
conflicts=(
  ${pkgname%-git}
  dsview
)
replaces=()
_qt=qt6
depends=(
  hicolor-icon-theme
  glib2
  libgcc
  libstdc++
  libusb
  libz.so
  ${_qt}-base
  fftw
  python
)
makedepends=(
  boost
  boost-libs
  cmake
  git
  ${_qt}-tools
  ninja
  pkgconf
  vulkan-headers
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}/${pkgname}"
  sed -i 's#MODE="0666"#TAG+="uaccess"#' DSView/DreamSourceLab.rules
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  export LDFLAGS+=" ${LDFLAGS}"
  cd "${srcdir}"/${pkgname}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -Wno-dev \
    -B build \
    -G Ninja
    
  ninja -C build
}

check() {
  cd "${srcdir}"/${pkgname}/
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
  install -Dm0644 "${srcdir}/${pkgname}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
