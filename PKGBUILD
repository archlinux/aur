# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mstflint'
pkgver='4.32.0.0'
_pkgver='4.32.0-1'
pkgrel='1'
pkgdesc='Open source version of MFT (Mellanox Firmware Tools)'
arch=('x86_64' 'aarch64')
url="https://github.com/Mellanox/${pkgname}"
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'iniparser' 'openssl' 'libxml2' 'libidn2' 'libpsl'
	 'libunistring' 'zlib' 'xz' 'icu' 'keyutils' 'brotli' 'sqlite'
	 'libxml2' 'jsoncpp' 'curl' 'libnghttp2')
makedepends=('rdma-core')
source=("${url}/archive/v${_pkgver}/${pkgname}-${_pkgver}.tar.gz"
	"${url}/pull/1237.patch"
	"${url}/pull/1239.patch")
sha256sums=('c19ac4241d72e2816f93334941f7ee8f59da178f8b72b2f0e217a94163bb319a'
            '26c9a98f39c8777d3b7ef7cad37b85eef1020fd720ab75b4fe005d177897d3a0'
            '3afc84b1a419c196a67374bd821ddc72e45ce77deaf458e751f33a9db44b0b79')

prepare() {
  cd "${pkgname}-${_pkgver}"

  # https://github.com/Mellanox/mstflint/pull/1237
  patch -p1 -i "../1237.patch"
  # https://github.com/Mellanox/mstflint/pull/1239
  patch -p1 -i "../1239.patch"

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
