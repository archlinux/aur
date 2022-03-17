# Maintainer: dreieck

_pkgname='github-wikito-converter'
pkgname="${_pkgname}-git"
epoch=1
pkgver=r97.20210426.2a1959d
pkgrel=2
pkgdesc='Generate HTML & PDF documentation from your Github wiki or any other markdown-based wiki.'
arch=('any')
url='https://github.com/yakivmospan/github-wikito-converter'
license=('cusrtom: MIT')
depends=(
  'wkhtmltopdf'
)
makedepends=(
  'git'
  'npm'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "${_pkgname}::git+https://github.com/yakivmospan/github-wikito-converter.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
}

pkgver () {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed -e 's|^[vV]||' -e 's|-[0-9a-f]+$||')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -v -m755 wikidoc.py "${pkgdir}/usr/bin/wikidoc"
  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.MIT.txt"
}
