# Maintainer: Zarloc <nichocolat@gmail.com>
# Contributor: Alessio <alessio@linux.com>
pkgname=k9s-git
_pkgname=k9s
pkgver=v0.40.4.r1.gab6454f1
pkgrel=1
pkgdesc='Kubernetes TUI for managing clusters and pods'
arch=(x86_64)
url='https://github.com/derailed/k9s'
license=(Apache-2.0)
makedepends=(git go)
depends=(glibc)
options=('!lto')
provides=(k9s)
conflicts=(k9s)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  cd $_pkgname
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd $_pkgname
  export LDFLAGS+=' -Wl,-z,shstk'
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir"

  local ld_flags=" \
    -X github.com/derailed/k9s/cmd.commit=$(git rev-parse --short HEAD) \
    -X github.com/derailed/k9s/cmd.date=NOTSET \
    -X github.com/derailed/k9s/cmd.version=$pkgver \
    -compressdwarf=false \
    -linkmode=external \
  "
  go build -v -ldflags "$ld_flags" -tags=netgo -o execs/k9s main.go
}

check() {
  cd $_pkgname
  go test ./...
}

package() {
  cd $_pkgname
  execs/k9s completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/k9s"
  execs/k9s completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_k9s"
  execs/k9s completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/k9s.fish"
  install -Dm755 "execs/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
