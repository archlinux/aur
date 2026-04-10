# Maintainer: Tom Hale <tom-at-the-rate-hale-dot-ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=pixeldrain-jkawamoto-git
pkgver=0.8.0.r0.g4457aba
pkgrel=4
pkgdesc='Pixeldrain client (pd) from jkawamoto/go-pixeldrain main branch'
arch=('x86_64')
_reponame=go-pixeldrain
url="https://github.com/jkawamoto/${_reponame}"
license=('MIT')
makedepends=('go' 'git')
depends=('glibc')
provides=('pixeldrain-jkawamoto')
conflicts=('pixeldrain-jkawamoto')
source=("git+https://github.com/jkawamoto/${_reponame}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_reponame}" || exit 1
  # --tags is required because upstream uses lightweight tags (not annotated).
  # Output: v0.8.0-0-g4457aba  →  0.8.0.r0.g4457aba
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_reponame}"
  export GOPATH="${srcdir}/go"
  msg2 'Downloading Go modules (this may take a while on slow links)...'
  go mod download -modcacherw
}

build() {
  cd "${_reponame}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="${srcdir}/go"

  go build -ldflags "-linkmode=external -X main.version=${pkgver}" -o pd ./cmd/pd
}

check() {
  cd "${_reponame}"
  export GOPATH="${srcdir}/go"
  # Only run packages that actually have test files — avoids '[no test files]' noise
  # without cosmetic filtering. go list inspects metadata; xargs -r passes only
  # matching import paths to go test.
  go list -f '{{if or .TestGoFiles .XTestGoFiles}}{{.ImportPath}}{{end}}' ./... \
    | xargs -r go test
}

package() {
  cd "${_reponame}"

  install -Dm755 pd "${pkgdir}/usr/bin/pd"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
