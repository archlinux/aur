# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=rabtap
pkgver=1.44.1
pkgrel=3
license=(GPL3)
pkgdesc="RabbitMQ wire tap and swiss army knife "
makedepends=('go')
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/jandelgado/rabtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/jandelgado/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c6b371da1f114c0130d1d9f492754c9f0ef23689770ac9dae939fd7a566627fd')

prepare() {
  # prevent creation of a `go` directory in one's home.
  # this directory cannot be removed with even `rm -rf` unless one becomes root
  # or changes the write permissions.
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  _git_commit="$(bsdcat ../"$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)"

  cd "${pkgname}-${pkgver}"/cmd/rabtap

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "-X 'main.BuildCommit=${_git_commit}'
              -X 'main.BuildDate=$(date -u +"%Y-%m-%dT%H:%M:%SZ")'
              -X 'main.BuildGoVersion=$(go version)'
              -X 'main.BuildVersion=v${pkgver}'
              -compressdwarf=false
              -linkmode external
              -extldflags '${LDFLAGS}'" \
    -o ../../bin/rabtap

  # clean now to ensure makepkg --clean works
  go clean -modcache
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./bin/rabtap

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
      ./LICENSE
}
