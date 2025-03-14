# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Anatol Pomozov
# Co-Maintainer: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview-git
pkgver=1.3.2.r57.gc3d50bc
pkgrel=1
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
  git config user.email "admin@taotieren.com"
  git config user.name "taotieren"
  git remote add taotieren https://github.com/taotieren/DSView.git
  git fetch --all
  git merge taotieren/fix-build
  git merge taotieren/update-zh
  sed -i 's#MODE="0666"#TAG+="uaccess"#' DSView/DreamSourceLab.rules
}

build() {
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
}
