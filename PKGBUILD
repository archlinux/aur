# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=tmpview-bin
pkgver=1.3.1
pkgrel=2
_upstream_pkgname="TMPview_v${pkgver}-STYLE"
pkgdesc='Viewer/converter between Turbo Macro Pro and plain text (TMPx) assembly formats'
arch=('x86_64')
url="https://style64.org/release/tmpview-v${pkgver}-style"
license=('custom:proprietary')
depends=('gcc-libs')
options=('!strip') # released binary is already stripped

source=("https://style64.org/file/${_upstream_pkgname}.zip")

sha512sums=(
  'db122a952f3c94631cd186d1a791d0aae2746946a4ff36e2bc0936eb3bdf91eea267ed5f16146c498c307b8e8eb46ca0c640bef14b575d59874aeb035c9815fd'
)

build() {
  echo >&2 'Adding license information'
  # Derived from the output of `tmpview --help`
  echo > "${srcdir}/LICENSE" '(c) Style 2006-2015'

  echo >&2 'Converting documentation to UTF-8'
  mkdir -p "${srcdir}/${_upstream_pkgname}/build"
  iconv -f cp437 -t utf-8 \
    -o "${srcdir}/${_upstream_pkgname}/build/STYLE.nfo" \
    "${srcdir}/${_upstream_pkgname}/STYLE.nfo"
}

package() {
  echo >&2 'Packaging executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/${_upstream_pkgname}/linux-${CARCH}/tmpview"

  echo >&2 'Packaging documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${_upstream_pkgname}/changelog.txt" \
    "${srcdir}/${_upstream_pkgname}/build/STYLE.nfo" \
    "${srcdir}/${_upstream_pkgname}/linux-${CARCH}/readme.txt" \

  echo >&2 'Packaging the example'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/example" \
    "${srcdir}/${_upstream_pkgname}/test-jmorph.src.prg"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/LICENSE"
}
