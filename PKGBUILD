# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Anatol Pomozov
# Co-Maintainer: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview-git
pkgver=1.3.2.r53.g2e9e2c8
pkgrel=6
pkgdesc='GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc.'
arch=($CARCH)
url='http://www.dreamsourcelab.com/'
license=('GPL-3.0-only')
provides=(
  ${pkgname%-git}
)
conflicts=(
  ${pkgname%-git}
)
replaces=()
# Upstream added VCS dependency to libsigrokdecode :/
_qt=qt6
depends=(
  boost-libs
  hicolor-icon-theme
  gcc-libs
  glib2
  glibc
  libusb
  ${_qt}-base
  fftw
  python
  zlib
)
makedepends=(
  boost
  cmake
  git
  ${_qt}-tools
  ninja
  pkgconf
)
source=("${pkgname}::git+https://github.com/DreamSourceLab/DSView.git")
sha1sums=('SKIP')

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
  cd "${srcdir}"/${pkgname}/

  git cherry-pick -n 80fd274fb1b73a842499a115f1672fcbb792c9d0
  git cherry-pick -n fa25478f206fd95108ce57983905b555e24d2b01
  git cherry-pick -n 502a418a4a301d1e9e41b23955d3a9179dac3b35
  git cherry-pick -n cdf3f540bc33ad46d8c47e8d0941db34a218df33
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
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
