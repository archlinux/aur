# Maintainer: Prasanth Baskar <bupdprasanth@gmail.com>

pkgname=harbor-cli
pkgver=0.0.2
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
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  # build harbor
  go build -o build/harbor \
    -ldflags "-X github.com/goharbor/harbor-cli/cmd/harbor/internal/version.Version=$(git describe --tags --abbrev=0) \
              -X github.com/goharbor/harbor-cli/cmd/harbor/internal/version.GitCommit=$(git rev-parse HEAD) \
              -X github.com/goharbor/harbor-cli/cmd/harbor/internal/version.BuildTime=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
              -X github.com/goharbor/harbor-cli/cmd/harbor/internal/version.ReleaseChannel=stable \
              -X github.com/goharbor/harbor-cli/cmd/harbor/internal/version.GoVersion=$(go version | awk '{print $3}')" \
    ./cmd/harbor/main.go
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" build/harbor
}
