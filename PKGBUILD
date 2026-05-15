# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

_pkgname=youtube
pkgname=youtubedr
pkgver=2.10.6
pkgrel=1
pkgdesc="Download YouTube videos"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url='https://github.com/kkdai/youtube'
license=('MIT')
makedepends=('go' 'git')
source=("git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${srcdir}/gomodcache"
  go clean -modcache
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "${srcdir}/${_pkgname}"
  go build -v -o youtubedr \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd/...
}

check() {
  cd "${srcdir}/${_pkgname}"
  #go test
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dvm755 youtubedr -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
