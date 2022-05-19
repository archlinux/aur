# Maintainer: Robert Falkenberg <robert.falkenberg@srs.io>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgbase=srsran-git
pkgname=$pkgbase
_pkgname=srsRAN
pkgver=22.4.0.r0.gf2dff0b7a
pkgrel=2
pkgdesc='Open source SDR LTE software suite from Software Radio Systems (SRS)'
arch=('x86_64')
url='https://www.srsran.com'
license=('AGPL3')
depends=('fftw' 'mbedtls' 'boost-libs' 'lksctp-tools' 'libconfig' 'pcsclite' 'srsgui')
makedepends=('cmake' 'boost' 'git')
#makedepends+=('libuhd' 'soapysdr' 'bladerf' 'zeromq') # for binary package distribution
optdepends=('libuhd: for USRP support'
            'soapysdr: for SoapySDR support'
            'bladerf: for bladeRF support'
            'zeromq: for ZeroMQ support')
provides=('srsue' 'srsenb' 'srsenb')
conflicts=('srslte' 'srsran' 'srsue' 'srsenb' 'srsenb')
source=("git+https://github.com/srsran/srsRAN.git"
        "0001-cmake-fix-build-for-cmake-option-BUILD_SHARED_LIBS-O.patch"
        "0002-add-missing-include-for-build-with-GCC-12.patch"
        "0003-adt-fsm-ignore-GCC-warning-for-template-specializati.patch"
        "0004-lib-asn1_utils-fix-out-of-bounds-access-on-zero-size.patch"
        "0005-cmake-gcc-disable-Werror-maybe-uninitialized-for-GCC.patch")
sha512sums=('SKIP'
            'cf684f173b53673ae2413b0c3a7261d24f1afd58e42727cdc594882b0367e470aa0416f4f4b675f773d9d5ef43cd21fbe9c97a3d67591bad559ea1352d593e8b'
            '0b690d3bb8a2a0009c24a9b68f6b0da2b202ba32c7d4dd71d0c102f510c7f50419099af7a1bc89ff94fd4f945bbfd08a211d4806e204cea479d9ae0220fc5eaf'
            '1115bfdf51d3026724535e8a847d2ec26c27281efb1063bf1e13e220aee2a1a051a83a0d38cb898aa42323f93c865d879132a085cd95f33a01f6365b4b2f1892'
            'da931d9a7437510ce009c604161a052727ef7566d376c268f524f56449271a33e2dff5f8e807fcabfb144fccb36b4a125f4bfd77b4d9663e6e9364a855046dc3'
            'a1ed2b6e57ed598a2e47e014a4941999962e5cc1c4677a08834844ffbc23d8dce76f25a1f4868e01976da14369a7550b550738eee68f460323b23238b7062685')
options=(!lto)

pkgver() {
  cd $_pkgname
  # get most recent tag      | append patch version _0 if not present           | remove leading zeros                | remove prefix 'release_'   |  add revision prefix 'r'; put periods
  git describe --long --tags | sed 's/\(release_[0-9]\+_[0-9]\+\)\(-\)/\1_0\2/' | sed 's/\(0\+\)\([1-9]*[0-9]\)/\2/g' | sed 's/^\(release_\)\1*//' |  sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

prepare() {
  # apply patches for compatibility with GCC 12.1.0
  patch --directory="${_pkgname}" -p1 -i "$srcdir/0001-cmake-fix-build-for-cmake-option-BUILD_SHARED_LIBS-O.patch"
  patch --directory="${_pkgname}" -p1 -i "$srcdir/0002-add-missing-include-for-build-with-GCC-12.patch"
  patch --directory="${_pkgname}" -p1 -i "$srcdir/0003-adt-fsm-ignore-GCC-warning-for-template-specializati.patch"
  patch --directory="${_pkgname}" -p1 -i "$srcdir/0004-lib-asn1_utils-fix-out-of-bounds-access-on-zero-size.patch"
  patch --directory="${_pkgname}" -p1 -i "$srcdir/0005-cmake-gcc-disable-Werror-maybe-uninitialized-for-GCC.patch"
}

build() {
  # clear compiler flags set by makepkg.conf
  CFLAGS=""
  CXXFLAGS=""

  echo 'Building srsran...'
  cmake \
    -B "build" \
    -S "${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make -C "build" -j12
}

check() {
  echo 'Running tests for srsran...'
  cd "$srcdir"/build
  ctest $(echo $MAKEFLAGS | grep -Po '\-j[0-9][0-9]*')
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
