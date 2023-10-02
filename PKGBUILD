# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mstflint'
pkgver='4.25.0.1'
_pkgver='4.25.0-1'
pkgrel='1'
pkgdesc='Mstflint - an open source version of MFT (Mellanox Firmware Tools)'
arch=('x86_64' 'aarch64')
url="https://github.com/Mellanox/${pkgname}"
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'iniparser' 'openssl' 'libxml2' 'libidn2' 'libpsl'
	 'libunistring' 'zlib' 'xz' 'boost-libs' 'icu' 'keyutils' 'brotli'
	 'jsoncpp' 'curl' 'libnghttp2')
makedepends=('rdma-core' 'boost' 'openssl')
source=("${url}/archive/v${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('46f5fda9c8687bbcdae62145c17ad70f6b1725d738985eb3c8efd8c71604ddc3')

prepare() {
  cd "${pkgname}-${_pkgver}"

  ./autogen.sh
  autoreconf -fvi

  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --libexecdir="/usr/lib" \
    --sysconfdir="/etc" \
    --localstatedir="/var/${pkgname}" \
    --enable-fw-mgr
}

build() {
  cd "${pkgname}-${_pkgver}"
  make
}

package() {
  cd "${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
