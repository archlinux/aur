# Maintainer: f0ruD <fzero@rubi.gd>
pkgname=witr
pkgver=0.3.3
pkgrel=1
pkgdesc="A tool to determine why a process is running."
arch=('x86_64' 'aarch64')
url="https://github.com/pranshuparmar/witr"
license=('Apache-2.0')
makedepends=('go' 'git')
conflicts=('witr-bin')
provides=('witr')
source=("git+https://github.com/pranshuparmar/witr.git#tag=v${pkgver}")

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  local _version_pkg="github.com/pranshuparmar/witr/internal/version"
  go build -ldflags "-compressdwarf=false -linkmode=external \
    -X ${_version_pkg}.Version=v$pkgver \
    -X ${_version_pkg}.Commit=$(git rev-parse --short HEAD) \
    -X ${_version_pkg}.BuildDate=$(date -u +%Y-%m-%d --date=@$SOURCE_DATE_EPOCH)" \
    ./cmd/witr
}

# check() {
#   cd "$pkgname"
#   go test ./...
# }

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/cli/witr.1 "$pkgdir/usr/share/man/man1/witr.1"

  ./$pkgname completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  ./$pkgname completion zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  ./$pkgname completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}


sha256sums=('7e0135f7e2f93b4521cc1355dc939ec5e68ec2e1db07831463475da9b425da17')
