# Maintainer: dreieck
# Contributor: Alexandre Pujol
# Contributor: emersion

_pkgname='pass-rotate'
pkgname="${_pkgname}-git"
pkgver=0.1+13.r73.20220113.06c7034
pkgrel=2
pkgdesc="A tool and library for rotating your password on online services."
arch=('any')
url="https://git.sr.ht/~sircmpwn/pass-rotate"
license=('MIT')
groups=()
depends=(
  'python>=3'
  'python-beautifulsoup4'
  'python-docopt'
  'python-html5lib'
  'python-requests'
)
makedepends=(
  'git'
  'python-setuptools'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
  "${_pkgname}::git+https://git.sr.ht/~sircmpwn/${_pkgname}"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
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

  python setup.py install --root="${pkgdir}/" --optimize=1

  for _docfile in CONTRIBUTING.md pass-rotate.ini README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -sv "../../licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
