# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_modulename="cf_clearance2"
_pkgname="python-${_modulename}"
pkgname="${_pkgname}"
pkgver=0.28.3
pkgrel=1
pkgdesc="Python purpose To make a cloudflare challenge pass successfully. (Don't confuse it with the similar, but different, package 'python-cf_clearance'.)"
arch=(
  'any'
)
url="https://pypi.org/project/cf-clearance2/"
license=('Apache')
depends=(
  'python'
  'python-playwright'
  'python-setuptools' # YES!, in /usr/lib/python3.10/site-packages/cf_clearance2/stealth.py
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  #'python-poetry'
  'python-wheel'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_modulename}-${pkgver}.tar.gz::https://pypi.io/packages/source/c/${_modulename}/${_modulename}-${pkgver}.tar.gz"
)
sha256sums=(
  '28528addccab425cc61dd0368060c29fe88eaf80e637b9ac63e72c06e92db62e'
)


build() {
  cd "${srcdir}/${_modulename}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_modulename}-${pkgver}"

  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
 
}
