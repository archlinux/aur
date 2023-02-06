# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: zoe (https://aur.archlinux.org/account/zoe)


_pkgname='audio-offset-finder'
pkgname="${_pkgname}-git"
pkgver=0.4.0+r52.20220602.f9abf6e
pkgrel=2
pkgdesc="A simple tool for finding the offset of an audio file within another file."
arch=('any')
url="https://github.com/abramhindle/${_pkgname}"
license=("Apache")
depends=(
  'ffmpeg'
  'python-librosa'
  'python-matplotlib'
  'python-numba'
  'python-numpy'
  'python-scipy>=0.12.0'
)
makedepends=(
  'git'
  'python-setuptools'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' setup.py | tail -n1 | sed -E -e 's|^[^=]*=||' -e 's|,.*$||' | tr -d \'\")"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  for _docfile in AUTHORS README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done

  install -D -v -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}

