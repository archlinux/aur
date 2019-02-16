# Maintainer: lukaszimmermann <luk.zim91 at gmail dot com>
# Contributor: saxonbeta <saxonbeta at gmail dot com>
pkgname=openms
_pkgname=OpenMS
pkgver=2.4.0
_pkgver=2.4
pkgrel=1
pkgdesc="C++ library and tools for LC/MS data management and analyses"
arch=('i686' 'x86_64')
url="http://www.openms.de"
license=('BSD')
depends=('boost' 'eigen' 'glpk' 'qt5-base' 'qt5-svg' 'sqlite' 'xerces-c')
makedepends=('autoconf' 'automake' 'cmake' 'fakeroot' 'gcc' 'make' 'patch')
source=("https://download.sourceforge.net/project/open-ms/${_pkgname}/${_pkgname}-${_pkgver}/${_pkgname}-${pkgver}-src.tar.gz"
        "OpenMS-TOPPView.desktop"
        "OpenMS-TOPPAS.desktop"
        "OpenMS.sh")
sha256sums=('86e8176b0f89cc86a10f5c3e60c34140d591e9e6c85f129ccbfa13ecb16a9af2'
            '4f93d5c22a8267e4fbde6883ecc34a00abfc2ee5eafb46f6d81256ad8a33cdac'
            '9b33c6c91d931802e88af89ade4beb6c8d05484d57d1ad804888511b7a8b00a0'
            '2cf69cb56959f101614129d2a87dc078daca904e1701ed674d399afed1ff306d')

# Variables 
_prefix="${_pkgname}-${pkgver}"
_openms_build="${_prefix}-build"

_physpath() {
	realpath -P "$1"
}

_goto_empty_dir_in_src() {
   cd "${srcdir}"
   rm -rf "$1"
   mkdir "$1"
   cd "$1"
}

_build_contrib() {
  _goto_empty_dir_in_src "${_contrib_build}"
  for contrib in $@; do
    cmake -DBUILD_TYPE="${contrib}" "$(_physpath ../${_prefix}/contrib)"
  done
}

_build_openms() {
  _goto_empty_dir_in_src "${_openms_build}"
  cmake \
    -DOPENMS_CONTRIB_LIBS="$(_physpath ../${_contrib_build})" \
    -DHAS_XSERVER=On \
    -DWITH_GUI=On \
    -DENABLE_TUTORIALS=Off \
    -DENABLE_DOCS=Off \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$(_physpath ${pkgdir}/usr)" \
    "$(_physpath ../${_prefix})"
  make $@
}

build() {

  # Variables
  local _contrib_build="contrib-build"

  # Build the required contribs, which cannot be covered by other Arch Linux packages
  # Note: We also build SQLITE, since AUR offers sqlite2. If this is installed,
  # the build process might erroneously link against sqlite2, which will then
  # break the build
  _build_contrib SQLITE SEQAN LIBSVM COINOR KISSFFT WILDMAGIC

  # Build OpenMS
  _build_openms OpenMS TOPP UTILS GUI
}

package() {
  cd "${srcdir}/${_openms_build}"
  make DESTDIR="${pkgdir}/usr" install
  local INSTALL='install -m644 -D'
  $INSTALL "${srcdir}/${_prefix}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  $INSTALL "${srcdir}/OpenMS-TOPPView.desktop" "${pkgdir}/usr/share/applications/OpenMS-TOPPView.desktop"
  $INSTALL "${srcdir}/OpenMS-TOPPAS.desktop" "${pkgdir}/usr/share/applications/OpenMS-TOPPAS.desktop"
  $INSTALL "${srcdir}/OpenMS.sh" "${pkgdir}/etc/profile.d/OpenMS.sh"
}
