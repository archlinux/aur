# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=python-cf_clearance
pkgname="${_pkgname}-git"
pkgver=0.28.3+1.r65.20221213.80d8dd5
pkgrel=1
pkgdesc="Python purpose To make a cloudflare challenge pass successfully."
arch=(
  'any'
)
url="https://github.com/vvanglro/cf-clearance"
license=('Apache')
depends=(
  'python'
  'python-playwright'
  'python-setuptools' # YES!, in /usr/lib/python3.10/site-packages/cf_clearance/stealth.py
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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

build() {
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
 
}
