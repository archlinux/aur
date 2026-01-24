# Maintainer:  dreieck
# Contributor: Dreamkey

_upstreamname=Adafruit_nRF52_nrfutil
_pkgname=python-adafruit-nrfutil
pkgname="${_pkgname}-git"
epoch=1
pkgver=0.5.3.post17+10.r82.20260123.735f540
pkgrel=2
pkgdesc="Modified version of Nordic's nrfutil 0.5.x for use with the Adafruit Feather nRF52"
_url="github.com/adafruit/${_upstreamname}"
url="https://${_url}"
arch=('any')
license=('BSD-3-Clause')
depends=( # Based on requirements.txt
  'python-pyserial>=2.7'
  'python-click>=5.1'
  'python-ecdsa>=0.13'
  'python>=3'
)
makedepends=(
  'git'
  'python-behave'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=(
  "adafruit-nrfutil=${pkgver}"
  "python-adafruit-nrfutil=${pkgver}"
  "python-nordicsemi=${pkgver}"
)
conflicts=(
  "adafruit-nrfutil"
  "python-adafruit-nrfutil"
  "python-nordicsemi"
)
source=("${_pkgname}::git+https://${_url}".git)
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
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

  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  _docfiles=(
    git.log
    README.md
  )
  _licensefiles=(
    license.txt
  )

  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done

  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
