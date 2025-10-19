# Maintainer: Dreieck
# Contributor: Tomasz Zok
_pkgname=pandoc-eisvogel-template
pkgname="${_pkgname}-git"
epoch=1
pkgver=3.2.1.r320.20250920.f99fe1d
pkgrel=1
pkgdesc="The 'eisvogel' LaTeX-template for pandoc. A clean pandoc LaTeX template to convert your markdown files to PDF or LaTeX. It is designed for lecture notes and exercises with a focus on computer science. The template is compatible with pandoc 2."
arch=(any)
url="https://github.com/Wandmalfarbe/pandoc-latex-template"
license=('BSD-3-Clause')
depends=('pandoc')
makedepends=(
  'bash'
  'git'
  'tar'
  'zip'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+https://github.com/Wandmalfarbe/pandoc-latex-template.git"
)

sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  chmod u+x tools/release.sh

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

build() {
  cd "${srcdir}/${_pkgname}"

  tools/release.sh
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -v -m644 -t "${pkgdir}/usr/share/pandoc/data/templates/"  dist/eisvogel.{latex,beamer}

  install -D -v -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  for _docfile in CHANGELOG.md README.md icon.png icon.svg; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _docdir in docs examples tests; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/"
  done
  chmod a+x "${pkgdir}/usr/share/doc/${_pkgname}/"/*/*.sh
  chmod a+x "${pkgdir}/usr/share/doc/${_pkgname}/"*/*/*.sh

  install -D -v -m644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
