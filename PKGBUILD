# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ankddev
_pkgname=envfetch
pkgname=${_pkgname}-bin
pkgver=1.2.0
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
sha256sums=('6cfc9cc9f1c7644dba9345bbb0388cc683a9e31684cb7f86d0f8965d681ec90c'
            '91a0d30191e69d9fb6ffe4f90b0064d6345e62fd1daace65b19477b4d3559815')
sha256sums_x86_64=('0323abe64aacb52a3efd290fc274b05cce098c40b8a8d17ff02879452c1290cb')
sha256sums_aarch64=('762e703420dc686d96706d430ad6813aa4e9f9a9f288eec993971eab9bce77ad')

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
