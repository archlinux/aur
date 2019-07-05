# Maintainer: Loodse <aur@loodse.com>

pkgname=kubeone
pkgver=0.9.2
pkgrel=1
pkgdesc="A lifecycle management tool for Highly-Available Kubernetes clusters"
url="https://www.kubeone.io"
arch=("x86_64")
license=("Apache")
makedepends=("go")
optdepends=("terraform: sourcing data about infrastructure and control plane nodes")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubermatic/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('2f752c1cd2307c169116d15f8f89e1112b24a8b201d2a48db5507623869f67dd992be7ea07b4b881f0c50ca5a1188b4f507ed21be2ef300f065c242673a0e0ea')

prepare(){
  mkdir -p gopath/src/github.com/kubermatic
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/kubermatic/$pkgname
}

build() {
  export GOPATH="$PWD"/gopath GOFLAGS="-gcflags=all=-trimpath=$PWD -asmflags=all=-trimpath=$PWD -ldflags=\"-extldflags=$LDFLAGS\""
  cd gopath/src/github.com/kubermatic/$pkgname
  make build
}

check() {
  export GOPATH="$PWD"/gopath GOFLAGS="-gcflags=all=-trimpath=$PWD -asmflags=all=-trimpath=$PWD -ldflags=\"-extldflags=$LDFLAGS\""
  cd gopath/src/github.com/kubermatic/$pkgname
  make test
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 dist/$pkgname "$pkgdir"/usr/bin/$pkgname

  mkdir -p "$pkgdir"/usr/share/doc
  cp -avr docs "$pkgdir"/usr/share/doc/$pkgname
  cp -avr examples "$pkgdir"/usr/share/doc/$pkgname/examples

  mkdir -p "$pkgdir"/usr/share/man/man1
  ./dist/$pkgname document man -o "$pkgdir"/usr/share/man/man1

  mkdir -p "$pkgdir"usr/share/bash-completion/completions
  ./dist/$pkgname completion bash > "$pkgdir"usr/share/bash-completion/completions/$pkgname
}
