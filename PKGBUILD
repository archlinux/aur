# Maintainer: Michael Gebetsroither <m.gebetsr@gmail.com>
pkgname=regclient
pkgver=0.3.10
pkgrel=2
pkgdesc='Docker and OCI Registry tooling - regctl / regsync / regbot'
arch=('x86_64' 'aarch64')
url='https://github.com/regclient/regclient'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/regclient/regclient/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e9ebf9e3c4538020b230eadf801282ae29c1837a599c569f72b9a77bbde64106')
_bins=('regbot' 'regctl' 'regsync')

build() {
  local _commit
  _commit="$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)"
  cd "$pkgname-$pkgver"
  # we want "clean" go binaries
  export CGO_ENABLED=0

  for i in ${_bins[@]}; do
    go build -ldflags "-s -w -extldflags -static -X github.com/regclient/regclient/cmd/$i/version.GitCommit=$_commit" \
      -tags nolegacy -trimpath -o build ./cmd/$i

    ./build/$i completion bash >$i.bash
    ./build/$i completion zsh >$i.zsh
  done
}

package() {
  cd "$pkgname-$pkgver"
  for i in ${_bins[@]}; do
    install -Dm755 "build/$i" -t "$pkgdir/usr/bin"
    install -Dm644 "$i.bash" "$pkgdir/usr/share/bash-completion/completions/$i"
    install -Dm644 "$i.zsh" "$pkgdir/usr/share/zsh/site-functions/_$i"
  done
}
