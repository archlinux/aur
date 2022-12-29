# Maintainer: dreieck

_pkgbase='jena1330-fonts'
_vcssuffix='-git'
pkgbase="${_pkgbase}${_vcssuffix}"
pkgname=(
  "jena1330-fonts-license"
  "jena1330-fonts-docs${_vcssuffix}"
  "jena1330-latex-font${_vcssuffix}"
  "jena1330-latex-font-example${_vcssuffix}"
  "otf-jena1330${_vcssuffix}"
  "ttf-jena1330${_vcssuffix}"
  "t1-jena1330${_vcssuffix}"
  "woff-jena1330${_vcssuffix}"
  "woff2-jena1330${_vcssuffix}"
)
pkgver=r105.20160920.75d5b9e
pkgrel=9
pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". LaTeX, OTF, TTF, Postscript Type 1, WOFF and WOFF2 fonts, latest Git checkout.'
arch=(
  'any'
)
url='http://www.linta.de/Jena1330/'
license=('OFL')
depends=()
makedepends=(
  'git'
  'fontforge'
  'html2md'
  'perl'
  'python'
  'python-html2text'
  'texlive-bin'
  'texlive-core'
)
optdepends=()
source=(
  "${_pkgbase}::git+https://github.com/Anaphory/Jena1330.git"
  "website.html::${url}"
  'LICENSE.OFL1.1.txt'
)
sha256sums=(
  'SKIP'
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
  cd "${srcdir}"

  html2text --no-wrap-links --body-width 0 --mark-code --reference-links --links-after-para --unicode-snob website.html > website.txt
  html2md -i website.html > website.md

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


### License:
package_jena1330-fonts-license() {
  pkgdesc='Common license file for the "jena1330-latex-font" and "*-jena1330" font packages.'
  optdepends=(
    "jena1330-latex-font: For a 'Jena1330' LaTeX font."
    "otf-jena1330: For a 'Jena1330' OTF font."
    "ttf-jena1330: For a 'Jena1330' TTF font."
    "t1-jena1330: For a 'Jena1330' Postscript Type 1 font."
    "woff-jena1330: For a 'Jena1330' WOFF font."
    "woff2-jena1330: For a 'Jena1330' WOFF2 font."
  )

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "${srcdir}/LICENSE.OFL1.1.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}


### General docs:
package_jena1330-fonts-docs-git () {
  pkgdesc='General documentation for the "jena1330-latex-font" and "*-jena1330" font packages. Latest Git checkout & latest upstream website fetch.'
  depends=("jena1330-fonts-license")
  optdepends=(
    "jena1330-latex-font-example: For a LaTeX specific example."
    "jena1330-latex-font: For a 'Jena1330' LaTeX font."
    "otf-jena1330: For a 'Jena1330' OTF font."
    "ttf-jena1330: For a 'Jena1330' TTF font."
    "t1-jena1330: For a 'Jena1330' Postscript Type 1 font."
    "woff-jena1330: For a 'Jena1330' WOFF font."
    "woff2-jena1330: For a 'Jena1330' WOFF2 font."
  )
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "${srcdir}/website.html"                    "${pkgdir}/usr/share/doc/${_pkgbase}/website.html"
  install -D -m644 -v "${srcdir}/website.txt"                     "${pkgdir}/usr/share/doc/${_pkgbase}/website.txt"
  install -D -m644 -v "${srcdir}/website.md"                      "${pkgdir}/usr/share/doc/${_pkgbase}/website.md"
  install -D -m644 -v "${srcdir}/website.url"                     "${pkgdir}/usr/share/doc/${_pkgbase}/website.url"
  install -D -m644 -v 'README'                                    "${pkgdir}/usr/share/doc/${_pkgbase}/README"
  ln -sv "/usr/share/licenses/jena1330-fonts-license/LICENSE.txt" "${pkgdir}/usr/share/doc/${_pkgbase}/LICENSE.txt"

  ## Symlink license
  install -d -m755 -v "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/usr/share/licenses/jena1330-fonts-license/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}


### LaTeX:
package_jena1330-latex-font-git() {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". LaTeX font, latest Git checkout.'
  depends=(
    "jena1330-fonts-license"
    "t1-jena1330${_vcssuffix}=${pkgver}"
  )
  optdepends=(
    'jena1330-fonts-docs: For the general documentation of the "Jena1330"-font.'
    "jena1330-latex-font-example: For an example LaTeX document using the font."
  )
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.tfm"                         "${pkgdir}/usr/share/texmf-dist/fonts/tfm/public/jena1330/Jena1330.tfm"
  install -D -m644 -v "work/jena1330.sty"                         "${pkgdir}/usr/share/texmf/tex/latex/jena1330/jena1330.sty"

  ## Provided by t1-jena1330 -- create directories and then symlink the files:
  install -d -m755 -v "${pkgdir}/usr/share/texmf-dist/fonts/afm/public/jena1330"
  install -d -m755 -v "${pkgdir}/usr/share/texmf-dist/fonts/type1/public/jena1330"
  ln -sv "/usr/share/fonts/Type1/Jena1330.afm"                    "${pkgdir}/usr/share/texmf-dist/fonts/afm/public/jena1330/Jena1330.afm"
  ln -sv "/usr/share/fonts/Type1/Jena1330.pfb"                    "${pkgdir}/usr/share/texmf-dist/fonts/type1/public/jena1330/Jena1330.pfb"

  ## Symlink license
  install -d -m755 -v "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/usr/share/licenses/jena1330-fonts-license/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}


### LaTeX example:
package_jena1330-latex-font-example-git() {
  pkgdesc='LaTeX example document using the "Jena1330" LaTeX font. Latest Git checkout.'
  depends=(
    "jena1330-fonts-license"
    "jena1330-latex-font"
  )
  optdepends=('jena1330-fonts-docs: For the general documentation of the "Jena1330"-font.')
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v 'work/BottomLeft.jpg'                       "${pkgdir}/usr/share/doc/${_pkgbase}/latex/example/src/BottomLeft.jpg"
  install -D -m644 -v 'work/TopRight.jpg'                         "${pkgdir}/usr/share/doc/${_pkgbase}/latex/example/src/TopRight.jpg"
  install -D -m644 -v 'work/VrowenlopAlexander'                   "${pkgdir}/usr/share/doc/${_pkgbase}/latex/example/src/VrowenlopAlexander"
  install -D -m644 -v 'work/jena.tex'                             "${pkgdir}/usr/share/doc/${_pkgbase}/latex/example/src/jena.tex"
  install -D -m644 -v 'work/jena.pdf'                             "${pkgdir}/usr/share/doc/${_pkgbase}/latex/example/jena.pdf"

  ## Symlink license
  install -d -m755 -v "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/usr/share/licenses/jena1330-fonts-license/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}


### OTF:
package_otf-jena1330-git () {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". OTF font, latest Git checkout.'
  depends=("jena1330-fonts-license")
  optdepends=('jena1330-fonts-docs: For the general documentation of the "Jena1330"-font.')
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.otf"                         "${pkgdir}/usr/share/fonts/OTF/Jena1330.otf"

  ## Symlink license
  install -d -m755 -v "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/usr/share/licenses/jena1330-fonts-license/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

}


### TTF:
package_ttf-jena1330-git () {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". TTF font, latest Git checkout.'
  depends=("jena1330-fonts-license")
  optdepends=('jena1330-fonts-docs: For the general documentation of the "Jena1330"-font.')
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.ttf"                         "${pkgdir}/usr/share/fonts/TTF/Jena1330.ttf"

  ## Symlink license
  install -d -m755 -v "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/usr/share/licenses/jena1330-fonts-license/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}


### Postscript Type 1:
package_t1-jena1330-git () {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". Postscript Type 1 font, latest Git checkout.'
  depends=("jena1330-fonts-license")
  optdepends=('jena1330-fonts-docs: For the general documentation of the "Jena1330"-font.')
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.afm"                         "${pkgdir}/usr/share/fonts/Type1/Jena1330.afm"
  install -D -m644 -v "work/Jena1330.pfa"                         "${pkgdir}/usr/share/fonts/Type1/Jena1330.pfa"
  install -D -m644 -v "work/Jena1330.pfb"                         "${pkgdir}/usr/share/fonts/Type1/Jena1330.pfb"

  ## Symlink license
  install -d -m755 -v "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/usr/share/licenses/jena1330-fonts-license/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}


### WOFF:
package_woff-jena1330-git () {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". WOFF font, latest Git checkout.'
  depends=("jena1330-fonts-license")
  optdepends=('jena1330-fonts-docs: For the general documentation of the "Jena1330"-font.')
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.woff"                        "${pkgdir}/usr/share/fonts/WOFF/Jena1330.woff"

  ## Symlink license
  install -d -m755 -v "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/usr/share/licenses/jena1330-fonts-license/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}


### WOFF2:
package_woff2-jena1330-git () {
  pkgdesc='A medieval textura as used by the main writer of the "Jenaer Liederhandschrift". WOFF2 font, latest Git checkout.'
  depends=("jena1330-fonts-license")
  optdepends=('jena1330-fonts-docs: For the general documentation of the "Jena1330"-font.')
  provides=("${pkgname%"${_vcssuffix}"}")
  conflicts=("${pkgname%"${_vcssuffix}"}")

  cd "${srcdir}/${_pkgbase}"

  install -D -m644 -v "work/Jena1330.woff2"                       "${pkgdir}/usr/share/fonts/WOFF2/Jena1330.woff2"

  ## Symlink license
  install -d -m755 -v "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/usr/share/licenses/jena1330-fonts-license/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
