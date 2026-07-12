# Maintainer: alexvoste <alexvostedev@proton.me>
pkgname=forgezero
pkgver=5.3.0.r225.g924c910
pkgrel=1
pkgdesc="Zero-overhead build tool for assembly, C, C++, Objective-C, and Gloria"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/forgezero-cli/forgezero"
license=('GPL-3.0-only')
makedepends=('go' 'git')
depends=()
source=("git+ssh://git@github.com/forgezero-cli/forgezero.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath"
  
  go build \
    -ldflags="-X github.com/forgezero-cli/ForgeZero/cmd/fz/cli.BuildDate=$(date +%Y-%m-%d) \
              -X github.com/forgezero-cli/ForgeZero/cmd/fz/cli.VersionCore=v$(git describe --tags --always | sed 's/^v//') \
              -s -w" \
    -o build/fz \
    cmd/fz/main.go
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/fz "$pkgdir/usr/bin/fz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
