# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_projectname="tweetypy"
_pyname="${_projectname}"
_pkgname="${_pyname}"
pkgname="${_pkgname}-fossil"
pkgver=1.1+1.r47.20230211.92a14d7d85
pkgrel=2
pkgdesc="A frequency excursion calculator and more (for bird songs analysis). Sucessor of 'FEX'."
arch=(
  'any'
)
url="https://code.jessemcclure.org/${_projectname}"
license=('custom: MIT')
depends=(
  'python>=3'
  'python-numpy'
  'python-pyaml'
  'python-pyqt6'
  'python-scipy'
)
makedepends=(
  'fossil'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=()
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "python-${_pyname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-${_pyname}"
)

source=(
  "${_projectname}::fossil+${url}"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_projectname}"

  printf '%s\n' " --> Generating source code repository commit log ..."
  fossil timeline > "${srcdir}/fossil.log"
}

pkgver() {
  cd "${srcdir}/${_projectname}"

  _ver="$(fossil describe | sed -E -e 's|^[vV]||' -e 's|\-[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(fossil info | grep -E '^check-ins:' | awk '{print $2}')"
  _date="$(fossil timeline -n 1 -F %d | head -n1 | awk '{print $1}' | tr -d '-')"
  _hash="$(fossil timeline -n 1 -F %h | head -n1)"
  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_projectname}"

  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_projectname}"

  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  _docfiles=(
    "${srcdir}/fossil.log"
    info.html
    README.rst
  )
  _licensefiles=(
    LICENSE.txt
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
