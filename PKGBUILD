# Maintainer: dreieck

_pkgname=woice
pkgname="${_pkgname}-git"
epoch=0
pkgver=0.0.4.r10.20230912.6b7799f
pkgrel=4
pkgdesc='Automatic login script for WIFIonICE public WiFi by Deutsche Bahn captive portals.'
url='https://github.com/keans/woice'
arch=(any)
license=(MIT)
depends=(
  'python>=3.7' 'python<4'
  'python-click'
  'python-lxml'
  'python-requests'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
optdepends=(
  "bash:           To make use of the NetworkManager integration."
  "networkmanager: To make use of the NetworkManager integration."
  "util-linux:     To make use of the NetworkManager integration (logging)."
  "which:          To make use of the NetworkManager integration."
  "wireless_tools: To make use of the NetworkManager integration."
)
provides=(
  "${_pkgname}"
  "python-${_pkgname}=${pkgver}"
  "python-${_pkgname}-git=${pkgver}"
  "nm-wifionice-login=${pkgver}"
  "nm-wifionice-login-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-${_pkgname}"
  "python-${_pkgname}-git"
  "nm-wifionice-login"
  "nm-wifionice-login-git"
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=[[:space:]]*[^[:space:]]' 'setup.py' | head -n1 | sed -E 's|^[[:space:]]*version[[:space:]]*=||' | sed -E 's|#.*$||' | tr -d \'\",)"
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

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -v -m755 'examples/wifionice.sh' "${pkgdir}/etc/NetworkManager/dispatcher.d/wifionice.sh"

  for _docfile in README.rst CHANGELOG.rst git.log; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m 644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
