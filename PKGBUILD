# Maintainer: vash909 <iu1bot@xzgroup.net>

pkgname=wsjtcb
pkgver=1.4.1
pkgrel=1
pkgdesc='CB-oriented fork of WSJT-X for weak-signal digital communications on 27 MHz'
arch=('x86_64')
url='https://github.com/vash909/WSJT-CB'
license=('GPL-3.0-only')
depends=(
  'boost-libs'
  'fftw'
  'glibc'
  'hamlib'
  'hicolor-icon-theme'
  'libgcc'
  'libgfortran'
  'libgomp'
  'libstdc++'
  'libusb'
  'qt5-base'
  'qt5-multimedia'
  'qt5-serialport'
  'qt5-websockets'
  'readline'
)
makedepends=(
  'boost'
  'cmake'
  'gcc-fortran'
  'git'
  'ninja'
  'pkgconf'
  'qt5-tools'
)
conflicts=('wsjtcb-git')
provides=('wsjtcb')

_srcname='WSJT-CB'
# 1.4.1 Scarlet; pinned upstream source revision.
_commit='f73435253b4227ecde518c50c38656b35cec01e1'
_srcdir="${_srcname}-${pkgver}"
source=(
  "${_srcdir}::git+${url}.git#commit=${_commit}"
)
sha256sums=(
  'SKIP'
)

build() {
  cmake -S "${_srcdir}" -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWSJT_SKIP_MANPAGES=ON \
    -DWSJT_GENERATE_DOCS=OFF \
    -DWSJT_ENABLE_WERROR=OFF \
    -DWSJT_BUILD_PATH_TESTS=ON \
    -DWSJT_BUILD_DECODER_TESTS=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_srcdir}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
