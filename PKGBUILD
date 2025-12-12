# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kulinsky
_pkgname=colorizer
pkgname=${_pkgname}-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='Tool for highlighting words in your terminal.'
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
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-amd64-linux")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux")
sha256sums=('65473bbe1f46f01acd01b91411b1d1098494ad5434fbdc2c568f95ded47b5ca6'
            '899735df4f3a0abe2802772f3f46a0bfbf37cf5fb7ab70f99ad5b7678f104f68')
sha256sums_x86_64=('4ccaf952ff0d2bb0a846e4ec4c568d826fa5b294fd32aed9f353789e36dc45c2')
sha256sums_aarch64=('20f027c94a935e061356d1cd4d6bdd5d31a7ae540448e2695844b05d98fef2f6')

prepare() {
  cd "${srcdir}/" || exit

  chmod +x "${_pkgname}-${CARCH}-${pkgver}"
}

build() {
  cd "${srcdir}/" || exit

  help2man ./"${_pkgname}-${CARCH}-${pkgver}" --output "MAN-${pkgver}.1" --no-info --no-discard-stderr
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
