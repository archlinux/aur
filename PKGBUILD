# Maintainer: ml <>
pkgname=vt-cli
pkgver=0.14.0
pkgrel=1
pkgdesc='VirusTotal Command Line Interface'
arch=('i686' 'x86_64')
url=https://virustotal.github.io/vt-cli/
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("https://github.com/VirusTotal/vt-cli/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('48b05532c8f3e02cf241a013a3e5a7747e9e882018e17fbf40c6a6b46af00fa8')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -o build/vt -ldflags "-linkmode=external -X github.com/VirusTotal/vt-cli/cmd.Version=$pkgver" ./vt
  build/vt completion bash >vt.bash
  build/vt completion zsh >vt.zsh
  build/vt completion fish >vt.fish
}

check() {
  cd "$pkgname-$pkgver"
  # yaml_test.go broken. fails upstream as well
  go test -ldflags "-linkmode=external" -short ./utils/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/vt -t "$pkgdir/usr/bin"
  install -Dm644 vt.bash "$pkgdir/usr/share/bash-completion/completions/vt"
  install -Dm644 vt.zsh "$pkgdir/usr/share/zsh/site-functions/_vt"
  install -Dm644 vt.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname".fish
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" doc/*
}
