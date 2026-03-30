# Maintainer: Ondrej Dohnal <dohnal@douball.eu>

_pkgname=ipfixcol2
pkgname=${_pkgname}-git
pkgver=v2.8.0
pkgrel=1
pkgdesc="High-performance NetFlow v5/v9 and IPFIX collector (RFC7011)"
arch=('any')
url="https://github.com/CESNET/ipfixcol2"
license=('LicenseRef-CESNET')
depends=('librdkafka' 'zlib' 'libfds')
makedepends=('cmake' 'make' 'gcc' 'pkg-config' 'python-docutils')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+${url}#tag=${pkgver}" "hotfix.patch")
sha256sums=("3eed06e539dc56466e1be7cc1a00e84c66f803565e1a762b22233396a7451105" "44599c6272292e3c87b0de1132d9a555bfdb5a662bdfa0a4d4abfba7e34aef73")

prepare() {
    cd "${_pkgname}"
    patch -Np1 -i ../hotfix.patch
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir build 
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make -j$(nproc)
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make install
}

clean() {
  rm -rf "${srcdir}/${_pkgname}/build"
}
