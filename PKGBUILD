# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="CCGraphiteP11"
pkgname="${_Name,,}"
pkgver=2.0.5.6
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
  'glibc'
  'libgcc'
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
noextract=(
  "${_Name}-${CARCH}.tar.gz"
)
sha256sums=('5fbe54e8f660906803ef89052ec3e438cb00f495d8219a422e51a9da496a3e47')
sha256sums_x86_64=('SKIP')
DLAGENTS=(
  'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --insecure -o %o %u'
)

prepare() {
  cd "${srcdir}"
  rm -rf "${_Name}-${CARCH}"
  mkdir -p "${_Name}-${CARCH}"
  bsdtar -xvzf "${_Name}-${CARCH}.tar.gz" -C "${_Name}-${CARCH}"
}

pkgver() {
  cd "${srcdir}/${_Name}-${CARCH}"
  find . -type f -name 'libCCGraphiteP11.so.*' \
    | sort \
    | head -n1 \
    | sed 's#.*/libCCGraphiteP11\.so\.##'
}

package() {
  cd "${srcdir}"
  install -vd "${pkgdir}/usr/lib"
  cp -vaT --no-preserve=ownership "${_Name}-${CARCH}" "${pkgdir}/usr/lib"

  install -vDm644 "${_Name}.module" "${pkgdir}/usr/share/p11-kit/modules/${_Name}.module"

  install -vd "${pkgdir}/usr/lib/pkcs11"
  ln -vsf "/usr/lib/lib${_Name}.so" "${pkgdir}/usr/lib/pkcs11/lib${_Name}.so"
}
