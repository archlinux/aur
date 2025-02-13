pkgname=kompose-git
__gitroot=github.com/kubernetes/kompose
pkgver=r1759.6b704502
pkgrel=1
pkgdesc="kompose takes a Docker Compose file and translates it into Kubernetes resources (git version)."
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://${__gitroot}"
license=('apache')
depends=( )
makedepends=('git' 'go')
provides=('kompose')
conflicts=('kompose' 'kompose-bin')
_gourl=$__gitroot
source=("$pkgname::git+https://${__gitroot}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw -buildvcs=false"
  export GOPATH="$srcdir"
  local ld_flags="-compressdwarf=false -linkmode=external"
  go build -v -o build -ldflags="$ld_flags" .
}


package() {
  cd "$srcdir/$pkgname"
  install -vDm755 -t "$pkgdir/usr/bin" ./build/kompose
  build/kompose completion bash \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kompose"
  build/kompose completion zsh \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kompose"
  build/kompose completion fish \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/kompose.fish"
}


pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
