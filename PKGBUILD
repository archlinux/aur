# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=onedev-tod
_pkgname=tod
pkgver=4.5.0
pkgrel=2
_pkgsrc="${_pkgname}-${pkgver}"
pkgdesc='TheOneDev CLI: OneDev issues, pull requests, builds and CI/CD jobs against local changes'
arch=('x86_64' 'aarch64')
url='https://code.onedev.io/onedev/tod'
license=('MIT')
depends=('glibc')
makedepends=('go')
# tod-bin (Todoist CLI) provides 'tod' and also installs /usr/bin/tod.
conflicts=('tod')
# The GitHub mirror carries the release tags the updater tracks.
source=("${_pkgsrc}.tar.gz::https://github.com/theonedev/tod/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('198c8c608e7cb910a11132f280bcccd234a1ca547f0a8551a7049d6824a55a23ab4672f492a2a735fcabbbd52868cc65efda688e9fbdd101cc75a1d031ca80b5')

prepare() {
  cd "${_pkgsrc}"
  export GOPATH="${srcdir}/gopath"
  go mod download -modcacherw
}

build() {
  cd "${_pkgsrc}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/ .
}

check() {
  cd "${_pkgsrc}"
  export GOPATH="${srcdir}/gopath"
  go test ./...
}

package() {
  cd "${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 readme.md cli.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
