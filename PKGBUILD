# Maintainer: vash909 <iu1bot@xzgroup.net>

pkgname=wsjtcb
pkgver=1.3.0
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
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${_srcdir}"

  # Add the out-of-line destructor required by the pimpl helper, regardless of
  # whether the upstream checkout uses LF or CRLF line endings.
  perl -0pi -e 's/(, QWidget \* = nullptr\);)(\r?\n)/$1$2  ~EqualizationToolsDialog ();$2/' \
    EqualizationToolsDialog.hpp

  perl -0pi -e 's/(void EqualizationToolsDialog::show \(\))/EqualizationToolsDialog::~EqualizationToolsDialog () = default;\n\n$1/' \
    EqualizationToolsDialog.cpp
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
