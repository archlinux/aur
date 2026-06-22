# Maintainer: Tom Hale <tom at hale dot ee>
# Based upon: https://github.com/manticore-projects/aurscan/blob/main/packaging/PKGBUILD
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=aurscan-manticore-release-git
pkgver=0.5.2
pkgrel=3
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
source=("$pkgname::git+$url.git"
        "andreas@manticore-projects.com.gpg")
sha256sums=('SKIP'
            '182cc1de21af47b7d5cd498cc21d04ff01d9a3cabc149dfcabba88a4be761322')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git tag --list | grep -E '^v[0-9]+\.' | sort -V | tail -1 | sed 's/^v//'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git reset --hard "v${pkgver}"

  # Verify the release tag's GPG signature against the bundled public key.
  printf 'Verifying signature on git tag v%s:\n' "${pkgver}"
  local _gnupghome; _gnupghome="$(mktemp -d)"
  gpg --homedir="${_gnupghome}" --import "${srcdir}/andreas@manticore-projects.com.gpg" >/dev/null 2>&1
  GNUPGHOME="${_gnupghome}" git verify-tag "v${pkgver}"
  rm -rf "${_gnupghome}"

  # go writes: GOMODCACHE (${srcdir}/.go-mod-cache)
  export GOMODCACHE="${srcdir}/.go-mod-cache"
  go mod download
}

build() {
  cd "${srcdir}/${pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  # go writes: GOMODCACHE (${srcdir}/.go-mod-cache), GOCACHE (${srcdir}/.go-build-cache)
  export GOMODCACHE="${srcdir}/.go-mod-cache"
  export GOCACHE="${srcdir}/.go-build-cache"
  local _date; _date="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  go build -ldflags="-s -w \
    -X github.com/manticore-projects/aurscan/internal/version.Version=v${pkgver} \
    -X github.com/manticore-projects/aurscan/internal/version.Commit=${pkgver} \
    -X github.com/manticore-projects/aurscan/internal/version.Date=${_date}" \
    -o aurscan "./cmd/aurscan"
}

check() {
  cd "${srcdir}/${pkgname}"
  export GOMODCACHE="${srcdir}/.go-mod-cache"
  export GOCACHE="${srcdir}/.go-build-cache"
  go list -f '{{if or .TestGoFiles .XTestGoFiles}}{{.ImportPath}}{{end}}' ./... \
    | xargs -r go test
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 aurscan "${pkgdir}/usr/bin/aurscan"
  ln -s aurscan "${pkgdir}/usr/bin/syay"
  ln -s aurscan "${pkgdir}/usr/bin/sparu"
  ln -s aurscan "${pkgdir}/usr/bin/aurscan-edit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
