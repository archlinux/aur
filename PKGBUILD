# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name='trufflehog'
pkgname="$_name-git"
pkgver=3.97.5.r1.g288a8a864
pkgrel=1
pkgdesc="Secrets scanner for repositories"
arch=('x86_64' 'aarch64')
url="https://trufflesecurity.com/$_name"
license=('AGPL-3.0-only')
provides=("$_name=$pkgver")
conflicts=("$_name")
depends=(
  'glibc'
)
makedepends=(
  'git'
  'go>=1.25.10'
)
source=("git+https://github.com/trufflesecurity/$_name")
b2sums=('SKIP')

prepare() {
  cd "$_name"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  go build -ldflags "-compressdwarf=false -linkmode external"
}

check() {
  cd "$_name"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  # make test-community
  go test -timeout=5m $(go list ./... | grep -v '/vendor/\|pkg/sources\|pkg/analyzer/analyzers')
}

package() {
  cd "$_name"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "docs/man/$_name.1"
  install -Dm0644 <(./trufflehog --completion-script-bash) "$pkgdir/usr/share/bash-completion/completions/$_name"
  install -Dm0644 <(./trufflehog --completion-script-zsh) "$pkgdir/usr/share/zsh/site-functions/_$_name"
}

# vim: ts=2 sw=2 et:
