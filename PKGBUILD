# Maintainer:  <none>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Marcin Nowak <marcin [dot] j [dot] nowak (at) gmail [dot] com>


pkgname=xasm
pkgver=3.2.1
pkgrel=3
pkgdesc="6502 cross-assembler with original syntax extensions. By default it generates binaries for Atari 8-bit computers."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/pfusik/xasm"
source=(
  "https://github.com/pfusik/xasm/archive/xasm-$pkgver.zip"
  "COPYING.txt"
)
sha256sums=(
  '3468bc239f9a54b3b3967ec021b90088ec0b92d279ff620703192dddd104c1f4'
  '0ac0b64e62cae3eef68466d603e86350503763edd86135265c9a4e06ee6f690d'
)
license=("LicenseRef-Poetic")
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'asciidoc'
  'dmd'
  'patch'
)

build() {
  cd "$srcdir/${pkgname}-xasm-${pkgver}"

  printf '%s\n' " --> building ..."
  make
}

package() {
  cd "$srcdir/${pkgname}-xasm-${pkgver}"

  printf '%s\n' " --> installing ..."
  make DESTDIR="${pkgdir}" prefix="/usr" install

  _docfiles=(
    README.md
  )
  _licensefiles=(
    "${srcdir}/COPYING.txt"
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
