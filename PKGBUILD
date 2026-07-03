# Maintainer: mirsella

pkgname=posthog-live
pkgver=20260527.121222
pkgrel=1
pkgdesc='Terminal UI for streaming live PostHog events'
arch=('x86_64' 'aarch64')
url='https://github.com/PostHog/posthog/tree/master/livestream'
license=('MIT')
depends=('glibc')
makedepends=('go')
_tag="${pkgname}-${pkgver/./-}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PostHog/posthog/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('6b8f3f49205efd35c646d026b728574978a3aba29377adea9d360cff85b963f4')

prepare() {
  cd "posthog-${_tag}/livestream"

  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "posthog-${_tag}/livestream"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false'

  go build -o "${pkgname}" ./tui
}

check() {
  cd "posthog-${_tag}/livestream"

  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false'

  go test ./tui/...
}

package() {
  cd "posthog-${_tag}"

  install -Dm755 "livestream/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
