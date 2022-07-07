# Maintainer: dreieck

_pkgname=woice
pkgname="${_pkgname}-git"
epoch=0
pkgver=0.0.2.r5.20200302.a22db46
pkgrel=2
pkgdesc='Automatic login script for WIFIonICE public WiFi by Deutsche Bahn captive portals.'
url='https://github.com/keans/woice'
arch=(any)
license=(MIT)
depends=(
  'python>=3' 'python<4'
  'python-lxml'
  'python-requests'
)
makedepends=(
  'git'
  'python-setuptools'
)
optdepends=(
  "networkmanager: To make use of the NetworkManager integration."
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
  "nm-wifionice.sh-distributionready.patch"
)
sha256sums=(
  'SKIP'
  '618d750f037af647e0392f264c70c5beaf3df202a66368434576e6b8143848d7'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  for _patch in 'nm-wifionice.sh-distributionready.patch'; do
    msg2 "Applying patch '${_patch}' ..."
    patch -N -p1 < "${srcdir}/${_patch}"
  done
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=[[:space:]]*[^[:space:]]' 'setup.py' | head -n1 | sed -E 's|^[[:space:]]*version[[:space:]]*=||' | sed -E 's|#.*$||' | tr -d \'\",)"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  python ./setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python ./setup.py install --skip-build --root="${pkgdir}" --optimize=1

  install -D -v -m755 'examples/wifionice.sh' "${pkgdir}/etc/NetworkManager/dispatcher.d/wifionice.sh"

  for _docfile in README.rst CHANGELOG.rst; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m 644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
