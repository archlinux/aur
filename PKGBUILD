# Maintainer: vash909 <iu1bot@xzgroup.net>

pkgname=wsjtcb
pkgver=1.1.0
pkgrel=1
pkgdesc='CB-oriented fork of WSJT-X for weak-signal digital communications on 27 MHz'
arch=('x86_64')
url='https://github.com/vash909/WSJT-CB'
license=('GPL-3.0-only')
depends=(
  'boost-libs'
  'fftw'
  'hamlib'
  'hicolor-icon-theme'
  'libusb'
  'qt5-base'
  'qt5-multimedia'
  'qt5-serialport'
  'qt5-websockets'
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
_tag="WSJT-CB-${pkgver}"
_srcdir="${_srcname}-${_tag}"
source=(
  "${_srcdir}::git+${url}.git#tag=${_tag}"
  'fix-equalizationtoolsdialog-pimpl-dtor.patch'
)
sha256sums=(
  'SKIP'
  '6cbddf5f92408931666575ad09d1ac6ea4208aec5a0e5bd1a53155d561eee925'
)

prepare() {
  cd "${_srcdir}"
  patch -Np1 -i "${srcdir}/fix-equalizationtoolsdialog-pimpl-dtor.patch"
}

build() {
  cmake -S "${_srcdir}" -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWSJT_SKIP_MANPAGES=ON \
    -DWSJT_GENERATE_DOCS=OFF \
    -DWSJT_ENABLE_WERROR=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_srcdir}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
