# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=texlive-emono
_pkgname=emono
pkgver=0.1.1
pkgrel=1
pkgdesc='Monochrome emoji fonts for pdfTeX and LaTeX'
arch=('any')
url='https://gitlab.com/arkades.org/emono'
license=('OFL-1.1')
depends=(
  'texlive-basic'
  'texlive-bin'
  'texlive-latex'
)
makedepends=(
  'python'
  'python-fonttools'
  'python-uharfbuzz'
)
install=texlive-emono.install
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://gitlab.com/arkades.org/emono/-/archive/v${pkgver}/emono-v${pkgver}.tar.gz"
)
sha256sums=('SKIP')

build() {
  cd "${srcdir}/emono-v${pkgver}"

  # emono.py fetches the pinned Noto Emoji Monochrome font revision
  # when the five source TTFs are not already present.
  python emono.py build --all-weights
}

package() {
  cd "${srcdir}/emono-v${pkgver}"

  install -dm755 "${pkgdir}/usr/share/texmf-dist"
  cp -a build/texmf/. "${pkgdir}/usr/share/texmf-dist/"

  install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  if [[ -f OFL.txt ]]; then
    install -m644 OFL.txt "${pkgdir}/usr/share/licenses/${_pkgname}/OFL.txt"
  fi

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  for file in README.md GOOGLE_README.txt; do
    if [[ -f "${file}" ]]; then
      install -m644 "${file}" "${pkgdir}/usr/share/doc/${_pkgname}/${file}"
    fi
  done
}
