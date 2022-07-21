# Maintainer: Dreieck
# Contributor: Tomasz Zok
_pkgname=pandoc-eisvogel-template
pkgname="${_pkgname}-git"
epoch=1
pkgver=2.0.0+23.r251.20220304.04e3296
pkgrel=1
pkgdesc="The 'eisvogel' LaTeX-template for pandoc. A clean pandoc LaTeX template to convert your markdown files to PDF or LaTeX. It is designed for lecture notes and exercises with a focus on computer science. The template is compatible with pandoc 2."
arch=(any)
url="https://github.com/Wandmalfarbe/pandoc-latex-template"
license=('custom')
depends=('pandoc')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Wandmalfarbe/pandoc-latex-template.git")

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed -E 's|^[vV]||' | sed -E -e 's|-g[0-9a-f]*$||' -e 's|-([0-9a-zA-Z]*)|+\1|')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -v -m644 'eisvogel.tex' "${pkgdir}/usr/share/pandoc/data/templates/eisvogel.latex"

  for _docfile in CHANGELOG.md README.md icon.png icon.svg .texlife.profile .travis.yml; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  for _docdir in docs examples tools; do
    cp -av "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/"
  done

  install -D -v -m644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -sv "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
