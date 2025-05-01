# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mstflint'
pkgver='4.31.0.0'
_pkgver='4.31.0-1'
pkgrel='3'
pkgdesc='Open source version of MFT (Mellanox Firmware Tools)'
arch=('x86_64' 'aarch64')
url="https://github.com/Mellanox/${pkgname}"
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'iniparser' 'openssl' 'libxml2' 'libidn2' 'libpsl'
	 'libunistring' 'zlib' 'xz' 'icu' 'keyutils' 'brotli' 'sqlite'
	 'libxml2' 'jsoncpp' 'curl' 'libnghttp2')
makedepends=('rdma-core')
source=("${url}/archive/v${_pkgver}/${pkgname}-${_pkgver}.tar.gz"
	"${url}/pull/1131.patch"
	"${url}/pull/1137.patch"
	"${url}/pull/1142.patch"
	"${url}/pull/1143.patch")
sha256sums=('f33d269418bfcb5ab3599c6fedd427d757b8c8826eaaea865a9133817f2f244c'
            'ca18f38144aa1cd26a6c9df8a2f6bff55d70fd68aaabe7bacfd32b8c79bf0dd4'
            '3dcabb59c1cb148eb8a15567051ef5bf0417140425805e33bae32e8d8a36a812'
            'd9340c823a82d19161acd99a3001d0d14d24c0c97433ce07a91a3372354717f6'
            '78fad200631f39bcb102999b3c30dc6556e691445a2505636cfa59c702e9ce09')

prepare() {
  cd "${pkgname}-${_pkgver}"

  # https://github.com/Mellanox/mstflint/issues/1133
  patch -p1 -i "../1131.patch"
  # https://github.com/Mellanox/mstflint/pull/1163
  patch -p1 -i "../1137.patch"
  # https://github.com/Mellanox/mstflint/pull/1142
  patch -p1 -i "../1142.patch"
  # https://github.com/Mellanox/mstflint/pull/1143
  patch -p1 -i "../1143.patch"

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
