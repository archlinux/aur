# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sachaos
_pkgname=tcpterm
pkgname=${_pkgname}-bin
pkgver=0.0.2
pkgrel=2
pkgdesc='A packet visualizer in TUI.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc' 'libpcap')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
sha256sums=('ec47d46b24ee9d8a58af1c6f75e3dae84afacaa303c40d12d378e870b1f4fd51'
            '6fcbefe8d40e664f37c372ad961774177ab76273f3a725d2ef392945f4b6dd97')
sha256sums_x86_64=('f54d102afa5e5211a948a421f98877db7164f893dde369b8dbfa1985dec80a4d')

prepare() {
  cd "${srcdir}/" || exit

  chmod +x ./${_pkgname}-${pkgver}
}

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname}-${pkgver} --output "MAN-${pkgver}.1" --no-info --no-discard-stderr
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

  ## ugly hack to fix deps issue
  install -dv "$pkgdir/usr/lib/"
  ln -sv "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"
}
