# Maintainer: Tom Hale <tom at hale dot ee>
# Based upon: https://github.com/manticore-projects/aurscan/blob/main/packaging/PKGBUILD
# Binary variant of aurscan-manticore-release-git: tracks the latest upstream
# GitHub release tag and installs the pre-built binaries instead of building
# from source.
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=aurscan-manticore-bin-release-git
pkgver=0.5.2
_pkgname=aurscan
pkgrel=1
pkgdesc="LLM-powered pre-build malware scanner for AUR packages (paru/yay editor-gate)"
arch=('x86_64' 'aarch64')
url="https://github.com/manticore-projects/aurscan"
license=('Apache-2.0')
makedepends=('git' 'curl' 'gnupg')
options=('!strip')
conflicts=('aurscan' 'aurscan-git' 'aurscan-manticore' 'aurscan-manticore-git' 'aurscan-manticore-release-git')
optdepends=(
  'paru: sparu wrapper, PreBuildCommand hook, and --update-check'
  'yay: syay wrapper, editor-gate hook, and --update-check'
  'claude-code: keyless backend via your Claude subscription'
  'openai-codex: keyless backend via your Codex subscription'
  'xdg-utils: open mail client for mailing-list reports'
)
# The git clone is used to discover the latest release tag and to verify its
# GPG signature; the release binary itself is fetched in build() so it always
# matches the tag makepkg picked.
source=("$pkgname::git+$url.git"
        "andreas-manticore.gpg")
sha256sums=('SKIP'
            '08ca421f7b39c6ca91e684fd18ab053466394e3658cabf89d001358e72b17def')

# Map Arch architecture -> upstream asset suffix
case "${CARCH:-}" in
  x86_64)  _asset="aurscan-linux-amd64" ;;
  aarch64) _asset="aurscan-linux-arm64" ;;
esac

pkgver() {
  cd "${srcdir}/${pkgname}"
  git tag --sort=-v:refname --list 'v[0-9]*' | head -1 | sed 's/^v//'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git fetch --tags --force
  git checkout "v${pkgver}"
}

build() {
  cd "${srcdir}"
  local _url="${url}/releases/download/v${pkgver}/${_asset}"
  if [[ ! -s "${_asset}" ]]; then
    curl -fsSL "$_url" -o "${_asset}"
  fi
}

check() {
  cd "${srcdir}"

  # 1. Verify the release tag's GPG signature against the bundled public key.
  #    Upstream signs tags with key 188331308EF56D11 (Andreas Reichel).
  local _gpghome="${srcdir}/.gnupg"
  rm -rf "$_gpghome"
  mkdir -p "$_gpghome"
  chmod 700 "$_gpghome"
  GNUPGHOME="$_gpghome" gpg --batch --homedir "$_gpghome" \
    --import "${srcdir}/andreas-manticore.gpg" >/dev/null 2>&1

  cd "${srcdir}/${pkgname}"
  if ! GNUPGHOME="$_gpghome" git tag -v "v${pkgver}" >/dev/null 2>&1; then
    GNUPGHOME="$_gpghome" git tag -v "v${pkgver}"
    printf '%s\n' "GPG verification of tag v${pkgver} failed" >&2
    return 1
  fi
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_asset}" "${pkgdir}/usr/bin/${_pkgname}"
  install -dt "${pkgdir}/usr/bin"
  ln -sf "${_pkgname}" "${pkgdir}/usr/bin/syay"
  ln -sf "${_pkgname}" "${pkgdir}/usr/bin/sparu"
  ln -sf "${_pkgname}" "${pkgdir}/usr/bin/aurscan-edit"

  # Ship LICENSE and README from the cloned tag so docs/licenses stay in sync
  # with the exact release the binary was built from.
  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD: