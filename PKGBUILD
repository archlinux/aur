# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="CCGraphiteP11"
pkgname="${_Name,,}"
pkgver=1.5.4
pkgrel=1
pkgdesc="PKCS#11 CryptoCard Graphite library"
arch=(
  'x86_64'
)
url="https://www.cryptotech.com.pl/en/technical-support/smart-card-software/"
license=(
  'LicenseRef-CryptoTech'
)
depends=(
  'gcc-libs'
  'glibc'
  'pcsclite'
)
makedepends=(
  'curl'
)
provides=(
  "lib${_Name}.so"
)
source=(
  "${_Name}.module"
)
source_x86_64=(
  "${_Name}-${CARCH}.tar.gz::https://download.cryptotech.com.pl/?key=graphitep11x64linux&mode=2"
)
sha256sums=('5fbe54e8f660906803ef89052ec3e438cb00f495d8219a422e51a9da496a3e47')
sha256sums_x86_64=('SKIP')
DLAGENTS=(
  'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --insecure -o %o %u'
)

pkgver() {
  cd "${srcdir}"
  bsdtar -tf "${_Name}-${CARCH}.tar.gz" \
  | sed -n 's/^libCCGraphiteP11\.so\.\([0-9]\+\.[0-9]\+\.[0-9]\+\)$/\1/p'
}

package() {
  cd "${srcdir}"
  # m644 ?
  install -vDm755 "lib${_Name}.so.${pkgver}" "${pkgdir}/usr/lib/lib${_Name}.so.${pkgver}"

  install -vDm644 "${_Name}.module" "${pkgdir}/usr/share/p11-kit/modules/${_Name}.module"

  cd "${pkgdir}/usr/lib"
  for lib in *.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  done

  # Add to default module search path for various programs
  install -vd "pkcs11"
  ln -vsf "/usr/lib/lib${_Name}.so" "pkcs11/lib${_Name}.so"
}
