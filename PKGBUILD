# Maintainer: ml <ml visu.li>
pkgname=kubectl-split-yaml
pkgver=0.1.0
pkgrel=4
pkgdesc='Split Kubernetes YAML output into one file per resource'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/nathforge/kubectl-split-yaml'
license=('Apache')
depends=('kubectl')
makedepends=('go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0e4cd1c5ba748b2ee366d7cfe17d2bdfcf1ea113b7c74120e39683dad59800bf')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -ldflags=-linkmode=external ./cmd/"$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  # plugin executables have to replace all but the first dash (-) with underscore
  # this is a stupid solution, but it works for any amount of dashes in the plugin name
  : "${pkgname//-/_}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/${_/_/-}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
