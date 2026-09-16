# Maintainer: empyrealm

pkgname=ibm-bob-bin
pkgver=1.126.0.bob2.1.0
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

# Decode compound pkgver back into the two parts needed for the upstream filename.
# pkgver uses only alphanumerics and dots (AUR rule); the upstream format is
# "${_vs}+bob${_bob}", e.g. "1.126.0+bob2.1.0".
_decode_ver() {
  # pkgver = "1.126.0.bob2.1.0"  →  _vs="1.126.0"  _bob="2.1.0"
  _vs="${pkgver%.bob*}"
  _bob="${pkgver##*.bob}"
}

_decode_ver
_upstream_ver="${_vs}+bob${_bob}"
_rpm="IBM-Bob-linux-x64-${_upstream_ver}.rpm"
_rpm_sha256='b328e31682b9028686fa08a063ae8e79b0b22b186a6020b5360ea981f1c08764'

# pkgver() queries the IBM Bob download page for the latest upstream version
# string and emits it in AUR-legal dot-only form.  makepkg --nobuild (or any
# AUR helper that supports VCS-style pkgver bumping) will call this and update
# pkgver in PKGBUILD automatically when a new release is published.
pkgver() {
  local raw
  raw="$(
    curl -fsS -A 'Mozilla/5.0' 'https://bob.ibm.com/download' \
      | grep -oE 'IBM-Bob-linux-x64-[0-9]+\.[0-9]+\.[0-9]+\+bob[0-9]+\.[0-9]+\.[0-9]+\.rpm' \
      | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\+bob[0-9]+\.[0-9]+\.[0-9]+' \
      | sort -Vr | head -1
  )"
  [[ -n "$raw" ]] || { echo "pkgver: could not detect upstream version" >&2; return 1; }
  # Convert "1.126.0+bob2.1.0"  →  "1.126.0.bob2.1.0"
  echo "${raw/+bob/.bob}"
}

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
