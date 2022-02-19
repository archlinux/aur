# Maintainer: Michael Gebetsroither <m.gebetsr@gmail.com>
pkgname=regclient
pkgver=0.3.10
pkgrel=1
pkgdesc='Docker and OCI Registry tooling regctl / regsync /regbot'
arch=('x86_64' 'aarch64')
url='https://github.com/regclient/regclient'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/regclient/regclient/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e9ebf9e3c4538020b230eadf801282ae29c1837a599c569f72b9a77bbde64106')
bins=('regbot' 'regctl' 'regsync')

build() {
  local _commit
  _commit="$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)"
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'

   go build -o build -ldflags="-linkmode=external \
    -X regclient.github.io/regclient/pkg/cmd/regclient/version.GitCommit=$_commit" ./cmd/...

  for i in ${bins[@]}; do
     ./build/$i completion bash >$i.bash
     ./build/$i completion zsh >$i.zsh
  done
}

package() {
  cd "$pkgname-$pkgver"
  for i in ${bins[@]}; do
    install -Dm755 "build/$i" -t "$pkgdir/usr/bin"
    install -Dm644 "$i.bash" "$pkgdir/usr/share/bash-completion/completions/$i"
    install -Dm644 "$i.zsh" "$pkgdir/usr/share/zsh/site-functions/_$i"
  done
}
