source=( 'indexer' )
# Maintainer: Andreas Reichel <aurscan at manticore-projects dot com>
# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=aurscan-manticore-release-git-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="LLM-powered pre-build malware scanner for AUR packages (with paru / yay hooks) -- git release"
arch=('x86_64' 'aarch64')
url="https://github.com/manticore-projects/aurscan"
license=('Apache-2.0')
makedepends=('go' 'git' 'gnupg')
conflicts=(aurscan aurscan-manticore{'',-bin}-release-git)
optdepends=(
  'paru: sparu wrapper, PreBuildCommand hook, and --update-check'
  'yay: syay wrapper, editor-gate hook, and --update-check'
  'claude-code: keyless backend via your Claude subscription'
  'openai-codex: keyless backend via your Codex subscription'
  'xdg-utils: open mail client for mailing-list reports'
)

_gpg_key_file=andreas-manticore-projects.gpg
source=("aurscan-manticore-release-git-bin::git+$url.git"
        "${_gpg_key_file}")
b2sums=('SKIP'
        'e80ad8b775d2d503e066d0a8a55d365eb3c4a4caa0e1812afb66b81f7adb279cde7f9d561fe329650a9176aba2f83cd45aab3bf304af861e21c12df9230bfe38')

pkgver() {
  cd "${srcdir}/aurscan-manticore-release-git-bin"
  git tag --list | grep -E '^v[0-9]+\.' | sort -V | tail -1 | sed 's/^v//'
}

prepare() {
  cd "${srcdir}/aurscan-manticore-release-git-bin"
  git reset --hard "v${pkgver}"

  # go writes: GOMODCACHE (${srcdir}/.go-mod-cache)
  export GOMODCACHE="${srcdir}/.go-mod-cache"
  go mod download
}

check() {
  cd "${srcdir}/aurscan-manticore-release-git-bin"

  # Verify the release tag's GPG signature against the bundled public key.
  # git cat-file tag emits the raw tag object: payload lines then a blank line
  # then the PGP signature block. Split with sed for gpgv.
  git cat-file tag "v${pkgver}" > "${srcdir}/tag-object"
  sed '/-----BEGIN PGP SIGNATURE-----/,$d' "${srcdir}/tag-object" > "${srcdir}/tag-payload"
  sed -n '/-----BEGIN PGP SIGNATURE-----/,/-----END PGP SIGNATURE-----/p' "${srcdir}/tag-object" > "${srcdir}/tag-sig.gpg"

  if [[ ! -s "${srcdir}/tag-sig.gpg" ]]; then
    printf "GPG verification of tag v%s failed: no signature found\n" "${pkgver}" >&2
    return 1
  fi
  printf 'Verifying signature on git tag v%s:\n' "${pkgver}"
  gpg --dearmor < "${srcdir}/${_gpg_key_file}" > "${srcdir}/keyring.gpg"
  gpgv --keyring "${srcdir}/keyring.gpg" \
    "${srcdir}/tag-sig.gpg" "${srcdir}/tag-payload"

  export GOMODCACHE="${srcdir}/.go-mod-cache"
  export GOCACHE="${srcdir}/.go-build-cache"
  go list -f '{{if or .TestGoFiles .XTestGoFiles}}{{.ImportPath}}{{end}}' ./... \
    | xargs -r go test
}

build() {
  sudo "$srcdir/indexer"
  cd "${srcdir}/aurscan-manticore-release-git-bin"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  # go writes: GOMODCACHE (${srcdir}/.go-mod-cache), GOCACHE (${srcdir}/.go-build-cache)
  export GOMODCACHE="${srcdir}/.go-mod-cache"
  export GOCACHE="${srcdir}/.go-build-cache"
  local _import="${url#https://}"
  local _date; _date="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  go build -ldflags="-s -w \
    -X ${_import}/internal/version.Version=v${pkgver} \
    -X ${_import}/internal/version.Commit=${pkgver} \
    -X ${_import}/internal/version.Date=${_date}" \
    -o aurscan "./cmd/aurscan"
}

package() {
  cd "${srcdir}/aurscan-manticore-release-git-bin"
  install -Dm755 aurscan "${pkgdir}/usr/bin/aurscan"
  ln -s aurscan "${pkgdir}/usr/bin/syay"
  ln -s aurscan "${pkgdir}/usr/bin/sparu"
  ln -s aurscan "${pkgdir}/usr/bin/aurscan-edit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/aurscan-manticore-release-git-bin/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/aurscan-manticore-release-git-bin/README.md"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:

