# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=owenthereal
_pkgname=ccat
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Colorizes output for cat.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/linux-amd64-1.1.0.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/linux-386-1.1.0.tar.gz")
sha256sums_x86_64=('b38e64cc237dd5e99185371861b52e1ab289e0c659174c3276b11c160de8ee9c')
sha256sums_i686=('338b95623d110b886c4bbba984f9c8056371db0e566fd3e9a46fd59b88b67308')

if [[ ${CCARCH} -eq ${arch[0]} ]]; then
	_MFLAGS="amd64"
else
	_MFLAGS="386"
fi

build() {
  cd "${srcdir}/linux-${_MFLAGS}-${pkgver}/" || exit

  help2man ./${_pkgname} --output "MAN.1" --no-info
  gzip "MAN.1"
}

package() {
  cd "${srcdir}/linux-${_MFLAGS}-${pkgver}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
