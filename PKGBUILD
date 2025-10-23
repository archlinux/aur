# Maintainer: Prasanth Baskar <bupdprasanth@gmail.com>

pkgname=harbor-cli
pkgver=0.0.13
pkgrel=1
pkgdesc='Official Harbor CLI'
arch=('x86_64')
url='https://goharbor.io'
license=('Apache-2.0')
makedepends=('git' 'go')
# options=('!lto')
source=("$pkgname::git+https://github.com/goharbor/harbor-cli.git#tag=v$pkgver")
sha512sums=('SKIP')
b2sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  # directory for the build output
  mkdir -p build

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go mod download  # Download Go modules/dependencies
}

build() {
  cd "$srcdir/$pkgname"

  # build harbor
  # Ensure Go flags are set and build the binary
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external \
    -X github.com/goharbor/harbor-cli/cmd/harbor/internal/version.Version=$(git describe --tags --abbrev=0) \
    -X github.com/goharbor/harbor-cli/cmd/harbor/internal/version.GitCommit=$(git rev-parse HEAD) \
    -X github.com/goharbor/harbor-cli/cmd/harbor/internal/version.BuildTime=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
    -X github.com/goharbor/harbor-cli/cmd/harbor/internal/version.ReleaseChannel=stable \
    -X github.com/goharbor/harbor-cli/cmd/harbor/internal/version.GoVersion=$(go version | awk '{print $3}')" \
    -o "$srcdir/$pkgname/build/harbor-cli" ./cmd/harbor/main.go
  }

  package() {
    cd "$srcdir/$pkgname"

    install -vDm755 -t "$pkgdir/usr/bin" build/harbor-cli
  }
