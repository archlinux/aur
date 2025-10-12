# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="fineftp-server"
pkgname="${_pkgname}-bin"
pkgver=1.5.1
pkgrel=2
pkgdesc="Minimal FTP server library for Windows and Unix flavors"
arch=('aarch64' 'x86_64')
url="https://github.com/eclipse-ecal/${_pkgname}"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
)
provides=(
  "${_pkgname}"
  "lib${_pkgname}.so"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgsrc}-ubuntu-24.04_arm64-shared.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgsrc}-ubuntu-24.04_amd64-shared.deb")
noextract=("${source_aarch64[@]%%::*}"
           "${source_x86_64[@]%%::*}")
sha256sums=('cdf2b56c32888ba397fdf99af8650394a2fccdaa83d204310adc55f9bc50cfcd'
            'ebd76f02867ea8fceeb0b2df629243395551f7d7519055d33c3a3a3ca72e2e25')
sha256sums_aarch64=('5abd76a15c3a0bc9e3982ca664e0a41f970e4ddbd79c24e682df044d135f1b47')
sha256sums_x86_64=('ad8945efc8b23661e4f2eb49e9f08375bc75fc3abb092ded86beb18c835ee448')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

package() {
  cd "${srcdir}"
  cp -vaT --no-preserve=ownership "${_pkgsrc}-${CARCH}" "${pkgdir}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
