# Maintainer: cebtenzzre <cebtenzzre (AT) gmail (DOT) com>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_pkgname=mstflint
pkgname=${_pkgname}425
_pkgver='4.25.0-1'
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc='Open-source version of MFT (Mellanox Firmware Tools) - old version for ConnectX-3 Pro'
arch=('x86_64' 'aarch64')
url="https://github.com/Mellanox/${_pkgname}"
license=('GPL-2.0-only OR Linux-OpenIB')
depends=('python' 'iniparser' 'openssl' 'libxml2' 'libidn2' 'libpsl'
	 'libunistring' 'zlib' 'xz' 'boost-libs' 'icu' 'keyutils' 'brotli'
	 'jsoncpp' 'curl' 'libnghttp2' 'sqlite')
makedepends=('rdma-core' 'boost')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${url}/archive/v${_pkgver}/${_pkgname}-${_pkgver}.tar.gz"
        '0001-fix-missing-includes.patch'
        '0002-remove-references-to-libboost_system.patch')
sha256sums=('46f5fda9c8687bbcdae62145c17ad70f6b1725d738985eb3c8efd8c71604ddc3'
            '28045b218edba0c38007d6812c38beb1afa05c707e59b49271ff0912e7b0ac74'
            'f6c403a0e61d22878be49f384aeabfd383705a351dbe9326c84b0287596d2a03')

prepare() {
  cd "${_pkgname}-${_pkgver}"

  patch -Np1 -i ../0001-fix-missing-includes.patch
  patch -Np1 -i ../0002-remove-references-to-libboost_system.patch

  ./autogen.sh
  autoreconf -fvi

  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --libexecdir="/usr/lib" \
    --sysconfdir="/etc" \
    --localstatedir="/var/${_pkgname}" \
    --enable-fw-mgr \
    --enable-xml2 \
    CFLAGS='-std=gnu17'  # gcc defaults to (GNU) C23 where bool is a keyword
}

build() {
  cd "${_pkgname}-${_pkgver}"
  make
}

package() {
  cd "${_pkgname}-${_pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
