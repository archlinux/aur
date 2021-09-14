# Maintainer: Dreieck
# Contributor: Tomasz Zok
_pkgname=pandoc-eisvogel-template
pkgname="${_pkgname}-git"
pkgver=2.0.0.8+236.g4909f13
pkgrel=1
pkgdesc="The 'eisvogel' LaTeX-template for pandoc. A clean pandoc LaTeX template to convert your markdown files to PDF or LaTeX. It is designed for lecture notes and exercises with a focus on computer science. The template is compatible with pandoc 2."
arch=(any)
url="https://github.com/Wandmalfarbe/pandoc-latex-template"
license=('custom')
depends=('pandoc')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+git://github.com/Wandmalfarbe/pandoc-latex-template.git")

sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    _ver="$(git describe --tags | awk -F- '{print $1"."$2}' | sed 's|^v||')"
    if [ -z $_ver ]; then
      error "Could not determine version. Aborting."
      return 1
    fi
    _rev="$(git rev-list --count HEAD)"
    _hash="$(git rev-parse --short HEAD)"
    printf "%s" "${_ver}+${_rev}.g${_hash}"
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
