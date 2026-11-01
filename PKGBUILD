# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=texlive-emono-git
_pkgname=emono
pkgver=\1.r\2.g\3\n
pkgrel=1
pkgdesc='Development version of monochrome emoji fonts for pdfTeX and LaTeX'
arch=('any')
url='https://gitlab.com/arkades.org/emono'
license=('OFL-1.1')
depends=(
  'texlive-basic'
  'texlive-bin'
  'texlive-latex'
)
makedepends=(
  'git'
  'python'
  'python-fonttools'
  'python-uharfbuzz'
)
provides=('texlive-emono')
conflicts=('texlive-emono')
install=texlive-emono.install
source=(
  "${_pkgname}::git+https://gitlab.com/arkades.org/emono.git#branch=main"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Prefer the latest reachable version tag; fall back before the first tag.
  local version
  if version=$(git describe --long --abbrev=7 --tags 2>/dev/null); then
    printf '%s\\n' "${version}" |
      sed -E 's/^v//; s/([^-]+)-([0-9]+)-g([0-9a-f]+)/\\1.r\\2.g\\3/; s/-/./g'
  else
    printf 'r%s.%s\\n' \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  python emono.py build --all-weights
}

package() {
  cd "${srcdir}/${_pkgname}"

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
