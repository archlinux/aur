# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mstflint'
pkgver='4.37.0.1'
_pkgver='4.37.0-1'
pkgrel='1'
pkgdesc='Open source version of MFT (Mellanox Firmware Tools)'
arch=('x86_64' 'aarch64')
_uri="github.com/Mellanox/${pkgname}"
url="https://${_uri}"
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'iniparser' 'openssl' 'libxml2' 'libidn2' 'libpsl'
	 'libunistring' 'zlib' 'xz' 'icu' 'keyutils' 'brotli' 'sqlite'
	 'libxml2' 'jsoncpp' 'curl' 'libnghttp2')
makedepends=('rdma-core')
source=("${pkgname}-${_pkgver}.tar.gz::https://codeload.${_uri}/tar.gz/refs/tags/v${_pkgver}")
sha256sums=('75405d8c7594c25a686eba0edfa4101312f3b63cdabae4870b259b796041a15a')

prepare() {
  cd "${pkgname}-${_pkgver}"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --libexecdir="/usr/lib" \
    --sysconfdir="/etc" \
    --localstatedir="/var/${pkgname}" \
    --enable-fw-mgr \
    --enable-nvfwreset \
    --enable-adb-generic-tools \
    --enable-xml2
}

build() {
  cd "${pkgname}-${_pkgver}"
  make
}

check() {
  cd "${pkgname}-${_pkgver}"
  make check
}

package() {
  cd "${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "README" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
