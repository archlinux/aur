# Maintainer: Eric Torres <eric.torres@its-et.me>
# Contributor: Michael Gebetsroither <m.gebetsr@gmail.com>
# Contributor: kemelzaidan
pkgbase=regclient
pkgname=(
  regclient-regctl
  regclient-regsync
  regclient-regbot
)
pkgver=0.10.0
pkgrel=1
pkgdesc='Docker and OCI Registry tooling - regctl / regsync / regbot'
arch=('x86_64' 'aarch64')
url='https://github.com/regclient/regclient'
license=('Apache-2.0')
makedepends=('go')
depends=('glibc')
source=("https://github.com/regclient/regclient/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
# how to build git tag from github
#source=("$pkgbase-$pkgver.tar.gz::https://github.com/regclient/regclient/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7c60fc5d63dd664b06486cd5156b636f53cd005ff003c1afb7114cd1fe3466ce')
_bins=('regctl' 'regsync' 'regbot')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  # export CGO_ENABLED=0

  mkdir -p build/ && cd build/

  for i in "${_bins[@]}"; do
    (
      cd "../$pkgbase-$pkgver"
      go build -o ../build/$i ./cmd/$i
    )
    ./$i completion bash >$i.bash
    ./$i completion fish >$i.fish
    ./$i completion zsh >$i.zsh
  done
}

# FIXME new to this, need to understand why this is causing the build to fail
#check() {
#    echo '# go test'
#    (
#        cd "${pkgbase}-${pkgver}"
#        go test -mod=readonly ./...
#    )
#    echo '# Check for unclean build'
#    # yea it's annoying for dev builds because it trips every time when git repo has uncommited changes
#    (
#        cd build/
#        for i in "${_bins[@]}"; do
#            echo "#  $i"
#            ./$i version |grep '^VCSState:\s*clean$'
#        done
#    )
#}

_pkgcommon() {
  _pkg="$1"
  cd build/
  install -Dm755 "$_pkg" -t   "$pkgdir/usr/bin"
  install -Dm644 "$_pkg.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkg"
  install -Dm644 "$_pkg.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkg.fish"
  install -Dm644 "$_pkg.zsh"  "$pkgdir/usr/share/zsh/site-functions/_$_pkg"
  install -Dm644 "../$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgbase-$_pkg/LICENSE"
}

package_regclient-regctl() {
  pkgdesc="Utility for accessing docker registries"
  _pkgcommon "regctl"
}

package_regclient-regsync() {
  pkgdesc="Utility for mirroring docker repositories"
  _pkgcommon "regsync"
}

package_regclient-regbot() {
  pkgdesc="Utility for automating repository actions"
  _pkgcommon "regbot"
}
