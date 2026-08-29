# Maintainer: empyrealm

pkgname=ibm-bob-bin
pkgver=1.126.0
_bobrel=2.0.3
_upstream_ver="${pkgver}+bob${_bobrel}"
pkgrel=1
pkgdesc='IBM Bob IDE repackaged from IBM upstream Linux binaries'
arch=('x86_64')
url='https://bob.ibm.com/download'
license=('custom:IBM')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'glib2'
  'gtk3'
  'libdrm'
  'libxcomposite'
  'libxdamage'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
)
makedepends=('curl')
optdepends=('org.freedesktop.secrets: credential storage integration')
provides=('bobide')
conflicts=('bobide')
options=('!strip')
source=()
sha256sums=()

_rpm="IBM-Bob-linux-x64-${_upstream_ver}.rpm"
_rpm_sha256='7303cc78c550288d163a61c66f04079001359f44d4cd2b5a201aac87efaf9569'

prepare() {
  cd "${srcdir}"

  if [[ -f "${_rpm}" ]]; then
    local current
    current="$(sha256sum "${_rpm}" | awk '{print $1}')"
    if [[ "${current}" == "${_rpm_sha256}" ]]; then
      return
    fi
    rm -f "${_rpm}"
  fi

  local download_url
  download_url="$(
    curl -fsS -D - -o /dev/null -X POST 'https://bob.ibm.com/api/download/bobide' \
      -F 'platform=linux' \
      -F "version=${_upstream_ver}" \
      -F 'architecture=x64' \
      -F 'packageType=rpm' \
      | awk 'BEGIN { IGNORECASE=1 } /^location: / { sub(/\r$/, "", $2); print $2 }'
  )"

  [[ -n "${download_url}" ]] || {
    echo 'Failed to resolve IBM Bob RPM download URL from bob.ibm.com API.' >&2
    return 1
  }

  curl -fL "${download_url}" -o "${_rpm}"

  echo "${_rpm_sha256}  ${_rpm}" | sha256sum -c -
}

package() {
  cd "${srcdir}"

  bsdtar --no-same-owner -xf "${_rpm}" -C "${pkgdir}"

  install -Dm644 \
    "${pkgdir}/usr/share/bobide/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
