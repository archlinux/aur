# Maintainer: Andreas Reichel <aurscan at manticore-projects dot com>
# Maintainer: Tom Hale <tom at hale dot ee>
#
# Binary variant of aurscan-manticore-release-git: tracks the latest upstream
# GitHub release tag and installs the pre-built binaries instead of building
# from source.
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=aurscan-manticore-bin-release-git
pkgver=0.6.3
_pkgname=aurscan
pkgrel=1
pkgdesc='LLM-powered pre-build malware scanner for AUR packages (with paru / yay hooks) -- git release binary'
arch=('x86_64' 'aarch64')
_repo="manticore-projects/aurscan"
url="https://github.com/${_repo}"
license=('Apache-2.0')
makedepends=('git' 'curl' 'gnupg')
options=('!strip')
conflicts=(aurscan aurscan-manticore{'',-bin}-release-git)
optdepends=(
  'paru: sparu wrapper, PreBuildCommand hook, and --update-check'
  'yay: syay wrapper, editor-gate hook, and --update-check'
  'claude-code: keyless backend via your Claude subscription'
  'openai-codex: keyless backend via your Codex subscription'
  'xdg-utils: open mail client for mailing-list reports'
)
# No git clone: pkgver() uses git ls-remote; GPG verify uses the release
# SHA256SUMS sidecar; binary, LICENSE, README, checksums and signature are
# fetched in build() from GitHub release assets and raw content URLs. All
# dynamic, so no static source entry for release assets.
_gpgkey="andreas-manticore-projects.gpg"
source=("${_gpgkey}")
b2sums=('e80ad8b775d2d503e066d0a8a55d365eb3c4a4caa0e1812afb66b81f7adb279cde7f9d561fe329650a9176aba2f83cd45aab3bf304af861e21c12df9230bfe38')

# Map Arch architecture -> upstream asset suffix
case "${CARCH:-}" in
  x86_64)  _asset="aurscan-linux-amd64" ;;
  aarch64) _asset="aurscan-linux-arm64" ;;
esac

_update_and_cache_flag='update_and_cache'
# Allow download of versioned files in prepare() -- build() must not download files
# Usually, pkgver() is called after prepare() and before build()
# Print the package version
# Called from prepare() with arg: "update_and_cache" to write to file.
# With no argument (eg usual makepkg), print the version already cached.
pkgver() {
  local _pkgver_cache_file="${srcdir}/.pkgver"

  if [[ -e "${_pkgver_cache_file}" && $1 != "${_update_and_cache_flag}" ]]; then
    cat "$_pkgver_cache_file" && return 0
  fi

  echo GENERATING >&2

  git ls-remote --tags "https://github.com/${_repo}.git" 'v[0-9]*' \
    | awk '{print $2}' | sed 's|^refs/tags/||; s/\^{}$//' \
    | sort -V -u | tail -1 | sed 's/^v//' | tee "${_pkgver_cache_file}"
}

prepare() {
  pkgver=$(pkgver "${_update_and_cache_flag}")  # pkgver() is usually only run after prepare()
  cd "${srcdir}"
  local _rel_url="${url}/releases/download/v${pkgver}"
  local _raw_url="https://raw.githubusercontent.com/${_repo}/v${pkgver}"
  curl -fsSL "${_rel_url}/${_asset}"      -o "${_asset}"
  curl -fsSL "${_rel_url}/SHA256SUMS"     -o SHA256SUMS
  curl -fsSL "${_rel_url}/SHA256SUMS.asc" -o SHA256SUMS.asc
  curl -fsSL "${_raw_url}/LICENSE"        -o LICENSE
  curl -fsSL "${_raw_url}/README.md"      -o README.md
}

check() {
  # Verify the release SHA256SUMS signature against the bundled public key,
  # then verify the downloaded binary matches the signed checksum manifest.
  cd "${srcdir}"
  printf 'Verifying GPG signature on SHA256SUMS for v%s:\n' "${pkgver}"
  gpg --dearmor < "${srcdir}/${_gpgkey}" > "${srcdir}/keyring.gpg"
  gpgv --keyring "${srcdir}/keyring.gpg" \
    "${srcdir}/SHA256SUMS.asc" "${srcdir}/SHA256SUMS"
  grep "  ${_asset}\$" "${srcdir}/SHA256SUMS" | sha256sum -c
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_asset}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -sf "${_pkgname}" "${pkgdir}/usr/bin/syay"
  ln -sf "${_pkgname}" "${pkgdir}/usr/bin/sparu"
  ln -sf "${_pkgname}" "${pkgdir}/usr/bin/aurscan-edit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
