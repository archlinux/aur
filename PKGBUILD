# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mstflint'
pkgver='4.28.0.1'
_pkgver='4.28.0-1'
pkgrel='1'
pkgdesc='Open source version of MFT (Mellanox Firmware Tools)'
arch=('x86_64' 'aarch64')
url="https://github.com/Mellanox/${pkgname}"
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'iniparser' 'openssl' 'libxml2' 'libidn2' 'libpsl'
	 'libunistring' 'zlib' 'xz' 'icu' 'keyutils' 'brotli' 'sqlite'
	 'jsoncpp' 'curl' 'libnghttp2')
makedepends=('rdma-core')
source=("${url}/archive/v${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('dca6bb3fc3571a16bbac310fe776ce829d22a67d399e888b4774308aad2058e8')

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
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "README" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
