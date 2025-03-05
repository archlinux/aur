# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ankddev
_pkgname=envfetch
pkgname=${_pkgname}-bin
pkgver=1.4.0
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
            '35e8a786b0df24875d354b94dc46376770f02d735bf78c4c0a402debbc0aa8c2')
sha256sums_x86_64=('b0211bf8371fbf97d9196fb0ffe6c6e70ed839e4098cbeac76ebd7dd1bab0e86')
sha256sums_aarch64=('4ee513206d77d3f724f729b04741bb36faf089cc879c211b29778aaf1d69de39')

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
