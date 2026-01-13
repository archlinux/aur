# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-accesscontrol
_pkgname=TangoAccessControl
pkgver=2.22
_pkgver=${_pkgname}-Release-${pkgver}
pkgrel=1
groups=("tango-controls")
pkgdesc="combined from svn/TangoAccessControl and svn/TangoAccessControl/AbstractClasses"
arch=("x86_64" "armv7h")
url="https://gitlab.com/tango-controls/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("glibc" "gcc-libs" "omniorb" "mariadb-libs" "tango-cpp" "tango-database")
makedepends=("cmake")
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/releases/${_pkgver}/downloads/${_pkgname}-with-submodules-${_pkgver}.tar.gz"
  tango-access.service
  fortify.patch
)
       
sha256sums=(
  "ced23d8f264d52590e607bb35ac3a49efe1f59f45b9b7dfbf6b9340e1eca3653"
  "883e32ba0309313d0929a329d11b2843c7dee018aa71d4c316779f0888fa4c48"
  "688a9008bc13c0ac29222cb992c6d7336162fdbc42b01790c3eb712e258876b1"
)

prepare() {
  cd "${_pkgname}-with-submodules-${_pkgver}"
  patch -N -p1 --input="${srcdir}/fortify.patch"
}

build() {
  cmake -B bld -S "${_pkgname}-with-submodules-${_pkgver}/${_pkgname}" \
  -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build bld
}

package() {
  DESTDIR="${pkgdir}" cmake --install bld
  install -Dm 644 tango-access.service \
  ${pkgdir}/usr/lib/systemd/system/tango-access.service
}
