# Maintainer: dreieck

_fontname='Jena1330'
_fontname_lowercase='jena1330'
_pkgname="${_fontname_lowercase}-latex-font"
_pkgvariantsuffix=''
_vcssuffix='-git'
pkgname="${_pkgname}${_pkgvariantsuffix}${_vcssuffix}"
pkgver=r105.20160920.75d5b9e
pkgrel=1
pkgdesc="A medieval textura as used by the main writer of the Jenaer
Liederhandschrift, LaTeX font, latest Git checkout."
arch=(
  'any'
)
url="https://github.com/Anaphory/${_fontname}"
license=('OFL')
depends=(
)
makedepends=(
  'git'
  'fontforge'
  'perl'
  'python'
  'texlive-bin'
  'texlive-core'
)
conflicts=(
  "${_pkgname}"
)
provides=(
  "${_pkgname}=${pkgver}"
  # "${_pkgname}${_pkgvariantsuffix}=${pkgver}"
  # "${_pkgname}${_vcssuffix}=${pkgver}"
)
install="${_fontname_lowercase}-latex-font.install"
source=(
  "${_pkgname}::git+${url}.git"  # Official upstream source
  "LICENSE.OFL1.1.txt"
  "${install}"
)
sha256sums=(
  'SKIP'
  'c9c5ffaa19f9427e2bf9ae8be6da4afb98dde3e0be07c8470410addf7afcd54d'
  '18bdb89666605a9c3c15b1a0a019dfcda848df7d7132ceededabbeb0a6e19b95'
)


pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./BuildAndInstall
}

check() {
  cd "${srcdir}/${_pkgname}"

  #make check
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m644 -v "work/${_fontname}.afm"                 "${pkgdir}/usr/share/texmf-dist/fonts/afm/public/${_fontname_lowercase}/${_fontname}.afm"
  install -D -m644 -v "work/${_fontname}.tfm"                 "${pkgdir}/usr/share/texmf-dist/fonts/tfm/public/${_fontname_lowercase}/${_fontname}.tfm"
  install -D -m644 -v "work/${_fontname}.pfb"                 "${pkgdir}/usr/share/texmf-dist/fonts/type1/public/${_fontname_lowercase}/${_fontname}.pfb"
  install -D -m644 -v "work/${_fontname_lowercase}.sty"       "${pkgdir}/usr/share/texmf/tex/latex/${_fontname_lowercase}/${_fontname_lowercase}.sty"

  install -D -m644 -v 'work/BottomLeft.jpg'                   "${pkgdir}/usr/share/doc/${_pkgname}/examples/BottomLeft.jpg"
  install -D -m644 -v 'work/TopRight.jpg'                     "${pkgdir}/usr/share/doc/${_pkgname}/examples/TopRight.jpg"
  install -D -m644 -v 'work/VrowenlopAlexander'               "${pkgdir}/usr/share/doc/${_pkgname}/examples/VrowenlopAlexander"
  install -D -m644 -v 'work/jena.tex'                         "${pkgdir}/usr/share/doc/${_pkgname}/examples/jena.tex"
  install -D -m644 -v 'work/jena.pdf'                         "${pkgdir}/usr/share/doc/${_pkgname}/examples/jena.pdf"

  install -D -m644 -v 'README'                                "${pkgdir}/usr/share/doc/${_pkgname}/README"

  install -D -m644 -v "${srcdir}/LICENSE.OFL1.1.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"  'LICENSE.OFL1.1.txt'
}
