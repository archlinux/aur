# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mstflint'
pkgver='4.31.0.0'
_pkgver='4.31.0-1'
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
	"https://patch-diff.githubusercontent.com/raw/Mellanox/${pkgname}/pull/1131.patch")
sha256sums=('f33d269418bfcb5ab3599c6fedd427d757b8c8826eaaea865a9133817f2f244c'
            '0e13fdd4642262d076ffce6ccdda7adab7db844572acc58eec4b9c8bb8392a3e')

prepare() {
  cd "${pkgname}-${_pkgver}"

  # https://github.com/Mellanox/mstflint/issues/1133
  patch -p1 -i "../1131.patch"

  ./autogen.sh
  autoreconf -fvi

  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --libexecdir="/usr/lib" \
    --sysconfdir="/etc" \
    --localstatedir="/var/${pkgname}" \
    --enable-fw-mgr \
    --enable-xml2
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
