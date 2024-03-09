# Maintainer: OpenSorcerer <alex cat opensourcery dog eu>
pkgname=cntb
pkgver=1.4.9
pkgrel=1
pkgdesc="Contabo Command Line Interface"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/contabo/cntb"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go' 'git')
provides=('cntb-bin')
conflicts=('cntb-bin')
source=("git+$url.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build-only
  ./cntb completion bash > cntb_bash
  ./cntb completion zsh > cntb_zsh
  ./cntb completion fish > cntb_fish
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 cntb "$pkgdir/usr/bin/cntb"
  install -Dm644 cntb_bash "$pkgdir/usr/share/bash-completion/completions/cntb"
  install -Dm644 cntb_zsh "$pkgdir/usr/share/zsh/site-functions/_cntb"
  install -Dm644 cntb_fish "$pkgdir/usr/share/fish/vendor_completions.d/cntb.fish"
}
