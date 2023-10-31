# Maintainer: Dreieck
# Contributor: Tomasz Zok
_pkgname=pandoc-eisvogel-template
pkgname="${_pkgname}-git"
epoch=1
pkgver=2.4.1.r280.20230906.8c48a17
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

prepare() {
  cd "${srcdir}/${_pkgname}"
  
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  # if [ -z "${_majorver}" ]; then
  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -v -m644 'eisvogel.tex' "${pkgdir}/usr/share/pandoc/data/templates/eisvogel.latex"

  install -D -v -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  for _docfile in CHANGELOG.md README.md icon.png icon.svg .texlife.profile; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _docdir in examples tests; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/"
    chmod a+x "${pkgdir}/usr/share/doc/${_pkgname}/${_docdir}"/*.sh
    chmod a+x "${pkgdir}/usr/share/doc/${_pkgname}/${_docdir}"/*/*.sh
  done

  install -D -v -m644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
