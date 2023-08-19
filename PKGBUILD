# Maintainer:  dreieck
# Contributor: Gavin Lloyd

_pkgname=tetherback
pkgname="${_pkgname}-git"
pkgver=0.9.1+20.r143.20230322.7797eb6
pkgrel=1
pkgdesc="Create backups of an Android device over USB (requires adb and TWRP recovery)."
arch=('any')
url="https://github.com/dlenski/tetherback"
license=('GPL3')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python>=3.6'
  'python-progressbar>=3.6'
  'python-tabulate'
)
conflicts=(
  "${_pkgname}"
)
provides=(
  "${_pkgname}=${pkgver}"
)
source=(
  "${_pkgname}::git+${url}.git"
  "setup.py-fix-version-detection.patch"
)
sha256sums=(
  'SKIP'
  '99aa1db7575ff1197e43e211ac94a9c44a66539769440de0544c4b144e72418d'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log

  patch -N -p1 --follow-symlinks -i "${srcdir}/setup.py-fix-version-detection.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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

build() {
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  _docfiles=(
    "git.log"
    "tetherback/README.md"
  )
  _licensefiles=()
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
