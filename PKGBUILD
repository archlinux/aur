# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=shuck-bin-release-git
_pkgname=shuck
pkgver=0.0.41
pkgrel=1
pkgdesc="Command-line shell checker and formatter — latest Git binary release"
arch=('x86_64')
url="https://github.com/ewhauser/shuck"
license=('MIT')
depends=('glibc>=2.35')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-release-git" "${_pkgname}-bin")
source=()
sha256sums=()
options=('!strip')

_baseurl="${url}/releases/download"
_target='x86_64-unknown-linux-gnu'
_archive="${_pkgname}-cli-${_target}.tar.xz"

pkgver() {
  git ls-remote --tags "${url}" 'v[0-9]*' \
    | awk '{print $2}' \
    | sed 's|^refs/tags/||' \
    | sort -V \
    | tail -1 \
    | sed 's/^v//'
}

prepare() {
  cd "${srcdir}"
  local _tag="v${pkgver}"
  local _release_url="${_baseurl}/${_tag}"
  local _checksum_file="sha256.sum"

  # Download binary archive and its upstream sha256 sidecar
  # We use curl directly here because the archive URL depends on pkgver(),
  # which is resolved at build time — makepkg's source=() cannot express this.
  # The sha256 sidecar is fetched from the same release and used to verify integrity.
  curl -fsSL "${_release_url}/${_checksum_file}" -o "${_checksum_file}"
  curl -fsSL "${_release_url}/${_archive}" -o "${_archive}"

  # Verify the archive against the upstream sha256 sidecar
  grep -F "${_archive}" "${_checksum_file}" | sha256sum -c -

  # Extract (strip the top-level target-triple directory)
  bsdtar -xf "${_archive}" --strip-components 1
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
