# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mstflint'
pkgver='4.33.0.0'
_pkgver='4.33.0-1'
pkgrel='1'
pkgdesc='Open source version of MFT (Mellanox Firmware Tools)'
arch=('x86_64' 'aarch64')
url="https://github.com/Mellanox/${pkgname}"
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'iniparser' 'openssl' 'libxml2' 'libidn2' 'libpsl'
	 'libunistring' 'zlib' 'xz' 'icu' 'keyutils' 'brotli' 'sqlite'
	 'libxml2' 'jsoncpp' 'curl' 'libnghttp2')
makedepends=('rdma-core')
source=("${url}/archive/v${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('c96e858d5104233d142e0db9d123b3c9cfc408aad0287016fbbf5bba8c4ab473')

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
