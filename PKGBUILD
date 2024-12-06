# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=lukasmartinelli
_pkgname=redis-pipe
pkgname=${_pkgname}-bin
pkgver=1.4.1
pkgrel=1
pkgdesc='Treat Redis Lists like Unix Pipes'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686')
license=('MIT')
depends=('redis')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_i686=("${_pkgname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_386.tar.gz")
sha256sums_x86_64=('4ab7c4dc2e0f5e090422127c669e4a556deb3dc55f71350695c75af81472f9d8')
sha256sums_i686=('b27506d6c9946e1482d78206f2df673b3edb4b21415e1bb37a4f35a98fa57863')

if [[ ${CCARCH} -eq ${arch[0]} ]]; then
  _ARCH="amd64"
else
  _ARCH="386"
fi

build() {
  cd "${srcdir}/${_pkgname}_linux_${_ARCH}/" || exit

  help2man ./${_pkgname} --output "MAN.1" --no-info
  gzip "MAN.1"
}

package() {
  cd "${srcdir}/${_pkgname}_linux_${_ARCH}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
