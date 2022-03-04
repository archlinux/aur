# Maintainer: Michael Gebetsroither <m.gebetsr@gmail.com>
pkgbase=regclient
pkgname=(
  regclient-regctl
  regclient-regsync
  regclient-regbot
)
pkgver=0.3.10
pkgrel=5
pkgdesc='Docker and OCI Registry tooling - regctl / regsync / regbot'
arch=('x86_64' 'aarch64')
url='https://github.com/regclient/regclient'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/regclient/regclient/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
# how to build git tag from github
#source=("$pkgbase-$pkgver.tar.gz::https://github.com/regclient/regclient/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9ebf9e3c4538020b230eadf801282ae29c1837a599c569f72b9a77bbde64106')
_bins=('regctl' 'regsync' 'regbot')

build() {
  local _commit
  _commit="$(bsdcat "$pkgbase-$pkgver.tar.gz" | git get-tar-commit-id)"
  mkdir -p build/ && cd build/
  # we want "clean" go binaries
  export CGO_ENABLED=0

  for i in ${_bins[@]}; do
    (
      cd "../$pkgbase-$pkgver"
      go build -ldflags "-s -w -extldflags -static -X github.com/regclient/regclient/cmd/$i/version.GitCommit=$_commit" \
        -tags nolegacy -trimpath -o ../build ./cmd/$i
    )

    ./$i completion bash >$i.bash
    ./$i completion zsh >$i.zsh
  done
}

check() {
	cd "${pkgbase}-${pkgver}"
	go test -mod=readonly ./...
}

_pkgcommon() {
  _pkg="$1"
  cd build/
  install -Dm755 "$_pkg" -t   "$pkgdir/usr/bin"
  install -Dm644 "$_pkg.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkg"
  install -Dm644 "$_pkg.zsh"  "$pkgdir/usr/share/zsh/site-functions/_$_pkg"
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
