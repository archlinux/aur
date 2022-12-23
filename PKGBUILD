# Maintainer: dreieck

_pkgbase='jena1330-fonts'
_vcssuffix='-git'
pkgbase="${_pkgbase}${_vcssuffix}"
pkgname=(
  "jena1330-latex-font${_vcssuffix}"
  "otf-jena1330${_vcssuffix}"
  "ttf-jena1330${_vcssuffix}"
  "t1-jena1330${_vcssuffix}"
  "woff-jena1330${_vcssuffix}"
  "woff2-jena1330${_vcssuffix}"
)
pkgver=r105.20160920.75d5b9e
pkgrel=4
pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". LaTeX, OTF and TTF font, latest Git checkout.'
arch=(
  'any'
)
url='http://www.linta.de/Jena1330/'
license=('OFL')
depends=()
makedepends=(
  'git'
  'fontforge'
  'perl'
  'python'
  'texlive-bin'
  'texlive-core'
)
optdepends=()
source=(
  "${_pkgbase}::git+https://github.com/Anaphory/Jena1330.git"
  'LICENSE.OFL1.1.txt'
)
sha256sums=(
  'SKIP'
  'c9c5ffaa19f9427e2bf9ae8be6da4afb98dde3e0be07c8470410addf7afcd54d'
)


prepare() {
  printf '%s\n' "${url}" > "${srcdir}/website.url"
}

pkgver() {
  cd "${srcdir}/${_pkgbase}"

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
  cd "${srcdir}/${_pkgbase}"

  # Build LaTeX stuff:
  ./BuildAndInstall

  # Build OTF font:
  fontforge -lang=ff -c 'Open("Jena1330.sfdir"); Generate("work/Jena1330.otf", "", 0x410201)'

  # Build TTF font:
  fontforge -lang=ff -c 'Open("Jena1330.sfdir"); Generate("work/Jena1330.ttf", "", 0x410201)'

  # Build additional Type 1 data:
  fontforge -lang=ff -c 'Open("Jena1330.sfdir"); Generate("work/Jena1330.pfa", "", 0x410201)'

  # Build WOFF font:
  fontforge -lang=ff -c 'Open("Jena1330.sfdir"); Generate("work/Jena1330.woff", "", 0x410201)'

  # Build WOFF2 font:
  fontforge -lang=ff -c 'Open("Jena1330.sfdir"); Generate("work/Jena1330.woff2", "", 0x410201)'
}

package_jena1330-latex-font-git() {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". LaTeX font, latest Git checkout.'
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.afm"                     "${pkgdir}/usr/share/texmf-dist/fonts/afm/public/jena1330/Jena1330.afm"
  install -D -m644 -v "work/Jena1330.tfm"                     "${pkgdir}/usr/share/texmf-dist/fonts/tfm/public/jena1330/Jena1330.tfm"
  install -D -m644 -v "work/Jena1330.pfb"                     "${pkgdir}/usr/share/texmf-dist/fonts/type1/public/jena1330/Jena1330.pfb"
  install -D -m644 -v "work/jena1330.sty"                     "${pkgdir}/usr/share/texmf/tex/latex/jena1330/jena1330.sty"

  install -D -m644 -v 'work/BottomLeft.jpg'                   "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/examples/BottomLeft.jpg"
  install -D -m644 -v 'work/TopRight.jpg'                     "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/examples/TopRight.jpg"
  install -D -m644 -v 'work/VrowenlopAlexander'               "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/examples/VrowenlopAlexander"
  install -D -m644 -v 'work/jena.tex'                         "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/examples/jena.tex"
  install -D -m644 -v 'work/jena.pdf'                         "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/examples/jena.pdf"

  install -D -m644 -v "${srcdir}/website.url"                 "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/website.url"
  install -D -m644 -v 'README'                                "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/README"
  install -D -m644 -v "${srcdir}/LICENSE.OFL1.1.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"
  cd "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"  'LICENSE.OFL1.1.txt'
}

package_otf-jena1330-git () {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". OTF font, latest Git checkout.'
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.otf"                     "${pkgdir}/usr/share/fonts/OTF/Jena1330.otf"

  install -D -m644 -v "${srcdir}/website.url"                 "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/website.url"
  install -D -m644 -v 'README'                                "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/README"
  install -D -m644 -v "${srcdir}/LICENSE.OFL1.1.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"
  cd "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"  'LICENSE.OFL1.1.txt'
}

package_ttf-jena1330-git () {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". TTF font, latest Git checkout.'
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.ttf"                     "${pkgdir}/usr/share/fonts/TTF/Jena1330.ttf"

  install -D -m644 -v "${srcdir}/website.url"                 "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/website.url"
  install -D -m644 -v 'README'                                "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/README"
  install -D -m644 -v "${srcdir}/LICENSE.OFL1.1.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"
  cd "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"  'LICENSE.OFL1.1.txt'
}

package_t1-jena1330-git () {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". Postscript Type 1 font, latest Git checkout.'
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.afm"                     "${pkgdir}/usr/share/fonts/Type1/Jena1330.afm"
  install -D -m644 -v "work/Jena1330.pfa"                     "${pkgdir}/usr/share/fonts/Type1/Jena1330.pfa"
  install -D -m644 -v "work/Jena1330.pfb"                     "${pkgdir}/usr/share/fonts/Type1/Jena1330.pfb"

  install -D -m644 -v "${srcdir}/website.url"                 "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/website.url"
  install -D -m644 -v 'README'                                "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/README"
  install -D -m644 -v "${srcdir}/LICENSE.OFL1.1.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"
  cd "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"  'LICENSE.OFL1.1.txt'
}

package_woff-jena1330-git () {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". WOFF font, latest Git checkout.'
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.woff"                    "${pkgdir}/usr/share/fonts/WOFF/Jena1330.woff"

  install -D -m644 -v "${srcdir}/website.url"                 "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/website.url"
  install -D -m644 -v 'README'                                "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/README"
  install -D -m644 -v "${srcdir}/LICENSE.OFL1.1.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"
  cd "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"  'LICENSE.OFL1.1.txt'
}

package_woff2-jena1330-git () {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". WOFF2 font, latest Git checkout.'
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.woff2"                   "${pkgdir}/usr/share/fonts/WOFF2/Jena1330.woff2"

  install -D -m644 -v "${srcdir}/website.url"                 "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/website.url"
  install -D -m644 -v 'README'                                "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}/README"
  install -D -m644 -v "${srcdir}/LICENSE.OFL1.1.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"
  cd "${pkgdir}/usr/share/doc/${pkgname%"${_vcssuffix}"}"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE.OFL1.1.txt"  'LICENSE.OFL1.1.txt'
}
