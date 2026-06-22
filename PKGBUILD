# Maintainer: Tom Hale <tom at hale dot ee>
# Binary variant of aurscan-manticore-release-git: tracks the latest upstream
# GitHub release tag and installs the pre-built binaries instead of building
# from source.
# Uses git ls-remote + GitHub API for version discovery and GPG verification
# (no full git clone needed).
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=aurscan-manticore-bin-release-git
pkgver=0.5.2
_pkgname=aurscan
pkgrel=3
pkgdesc='LLM-powered pre-build malware scanner for AUR packages (with paru / yay hooks) -- git release binary'
arch=('x86_64' 'aarch64')
_repo="manticore-projects/aurscan"
url="https://github.com/${_repo}"
license=('Apache-2.0')
makedepends=('git' 'curl' 'gnupg' 'jq')
options=('!strip')
conflicts=(aurscan aurscan-manticore{'',-bin}-release-git)
optdepends=(
  'paru: sparu wrapper, PreBuildCommand hook, and --update-check'
  'yay: syay wrapper, editor-gate hook, and --update-check'
  'claude-code: keyless backend via your Claude subscription'
  'openai-codex: keyless backend via your Codex subscription'
  'xdg-utils: open mail client for mailing-list reports'
)
# No git clone: pkgver() uses git ls-remote; GPG verify uses GitHub API; binary,
# LICENSE, and README are fetched in build() from GitHub release assets and raw
# content URLs. All dynamic, so no static source entry for release assets.
_gpgkey="andreas@manticore-projects.com.gpg"
source=("${_gpgkey}")
sha256sums=('182cc1de21af47b7d5cd498cc21d04ff01d9a3cabc149dfcabba88a4be761322')

# Map Arch architecture -> upstream asset suffix
case "${CARCH:-}" in
  x86_64)  _asset="aurscan-linux-amd64" ;;
  aarch64) _asset="aurscan-linux-arm64" ;;
esac

pkgver() {
  git ls-remote --tags "https://github.com/${_repo}.git" 'v[0-9]*' \
    | awk '{print $2}' \
    | sed 's|^refs/tags/||; s/\^{}$//' \
    | sort -V -u \
    | tail -1 \
    | sed 's/^v//'
}

prepare() {
  true
}

build() {
  cd "${srcdir}"
  local _rel_url="${url}/releases/download/v${pkgver}"
  local _raw_url="https://raw.githubusercontent.com/${_repo}/v${pkgver}"
  curl -fsSL "${_rel_url}/${_asset}" -o "${_asset}"
  curl -fsSL "${_raw_url}/LICENSE"   -o LICENSE
  curl -fsSL "${_raw_url}/README.md" -o README.md
}

check() {
  # Verify the release tag's GPG signature against the bundled public key via
  # the GitHub API (avoids a full git clone).
  local _api="https://api.github.com/repos/${_repo}"
  local _ref_sha

  _ref_sha=$(curl -fsS "${_api}/git/ref/tags/v${pkgver}" | jq -r '.object.sha')

  # jq -j omits trailing newline; payload and signature must be exact bytes
  if ! curl -fsS "${_api}/git/tags/${_ref_sha}" \
    | jq -j '.verification.payload' > "${srcdir}/tag-payload" 2>/dev/null \
    || [[ ! -s "${srcdir}/tag-payload" ]]; then
    printf "GPG verification of tag v%s failed: could not fetch tag payload\n" "${pkgver}" >&2
    return 1
  fi
  curl -fsS "${_api}/git/tags/${_ref_sha}" \
    | jq -j '.verification.signature' > "${srcdir}/tag-sig.gpg"

  printf 'Verifying signature on git tag v%s:\n' "${pkgver}"
  gpg --dearmor < "${srcdir}/${_gpgkey}" > "${srcdir}/keyring.gpg"
  gpgv --keyring "${srcdir}/keyring.gpg" \
    "${srcdir}/tag-sig.gpg" "${srcdir}/tag-payload"
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
