# Maintainer: Tom Hale <tom at hale dot ee>
# Based upon: https://github.com/manticore-projects/aurscan/blob/main/packaging/PKGBUILD
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=aurscan-manticore-release-git
pkgver=0.4.2
_pkgname=aurscan
pkgrel=1
pkgdesc="LLM-powered pre-build malware scanner for AUR packages (paru/yay editor-gate)"
arch=('x86_64' 'aarch64')
url="https://github.com/manticore-projects/aurscan"
license=('Apache-2.0')
makedepends=('go' 'git')
conflicts=('aurscan' 'aurscan-git' 'aurscan-manticore' 'aurscan-manticore-git')
optdepends=(
  'paru: sparu wrapper and --update-check'
  'yay: syay wrapper and --update-check'
  'claude-code: keyless backend via your Claude subscription'
  'openai-codex: keyless backend via your Codex subscription'
  'xdg-utils: open mail client for mailing-list reports'
)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git tag --list | grep -E '^v[0-9]+\.' | sort -V | tail -1 | sed 's/^v//'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git reset --hard "v${pkgver}"
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
    -o "${_pkgname}" "./cmd/${_pkgname}"
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
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "${_pkgname}" "${pkgdir}/usr/bin/syay"
  ln -s "${_pkgname}" "${pkgdir}/usr/bin/sparu"
  ln -s "${_pkgname}" "${pkgdir}/usr/bin/aurscan-edit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
