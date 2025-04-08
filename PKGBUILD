# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ankddev
_pkgname=envfetch
pkgname=${_pkgname}-bin
pkgver=2.1.2
pkgrel=1
pkgdesc='Lightweight CLI tool for working with environment variables'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
sha256sums=('b55367732c708aae2332981d9f093b62183876aeb28b424e4b4138db94737366'
            'fb240d7d1f59464070ece1d3f571a30c0479279ddee36d5d14fdd5a3041774e0')
sha256sums_x86_64=('2d3c3d78868f1d758466e318521c2dde5c4aa2a1c7dfe8b403af68a9c0f99d56')
sha256sums_aarch64=('6119f9ccff864d627c823d812bd32eb6039a79956bc321fff44384a36a1b5aa4')

prepare() {
  cd "${srcdir}/" || exit

  chmod +x ./${_pkgname}-${CARCH}-${pkgver}
}

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname}-${CARCH}-${pkgver} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
