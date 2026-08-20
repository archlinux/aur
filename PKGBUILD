# Maintainer: prochac <tomas.prochazka5d[at]gmail[dot]com>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>

_gitname=vuln
pkgname=govulncheck-git
pkgver=1.7.0.r1.gff4f1c5e8
pkgrel=1
pkgdesc='Database client and tools for the Go vulnerability database (git version)'
url='https://go.googlesource.com/vuln/'
arch=('x86_64')
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go' 'git')
provides=("govulncheck=${pkgver}")
conflicts=('govulncheck')
source=("git+https://go.googlesource.com/${_gitname}")
b2sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_gitname}"
  go mod download
}

build() {
  cd "${_gitname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  # Build outside the worktree: an untracked binary in it would make the
  # VCS stamp report +dirty and would also perturb pkgver() on rebuilds.
  go build -o "${srcdir}/govulncheck" ./cmd/govulncheck
}

package() {
  cd "${_gitname}"
  install -Dm 755 "${srcdir}/govulncheck" -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
