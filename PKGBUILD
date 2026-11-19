# Maintainer: agony <27015 at riseup dot net>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=scorecard
pkgver=5.6.0
pkgrel=2
pkgdesc='Security health metrics for Open Source'
arch=('x86_64')
url='https://github.com/ossf/scorecard'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ossf/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c0ff21580bf61f72efd6e1b1badaa7b286a169640ba5c471ea16228c60396e5f34b1b8563f63c4fff18bea9571ba1938ae66b56800e4a5f877111461eb55f714')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v \
    -ldflags="-linkmode=external -X sigs.k8s.io/release-utils/version.gitVersion=v${pkgver} -X sigs.k8s.io/release-utils/version.gitTreeState=clean" \
    -o scorecard .
  for shell in bash fish zsh; do
    ./scorecard completion "${shell}" > "completion.${shell}"
  done
  # Upstream names the root command ./scorecard,
  # and cobra registers the completions under that name
  sed -i 's|\./scorecard|scorecard|g' completion.{bash,fish,zsh}
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  export TMPDIR="${srcdir}/tmp"
  mkdir -p "${TMPDIR}"
  # These tests fetch the digest of python:3.7 from Docker Hub
  SKIP_GINKGO=1 go test -skip '^TestMixedPinning$|^TestCollectDockerfilePinning$/^Non-pinned_dockerfile' ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 scorecard -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/scorecard"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/scorecard.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_scorecard"
}
