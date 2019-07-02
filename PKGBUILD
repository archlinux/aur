# Maintainer: Loodse <aur@loodse.com>

pkgname=kubeone
pkgver=0.9.0
pkgrel=1
pkgdesc="A lifecycle management tool for Highly-Available Kubernetes clusters"
url="https://www.kubeone.io"
arch=("x86_64")
license=("Apache")
makedepends=("go")
optdepends=("terraform: sourcing data about infrastructure and control plane nodes")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubermatic/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e42a0704569b498791030f83ec35754e6b3314be8dcb6d129dbf6d82220ff44dc7f5827869db3c277f73496a96c2c7b43aa4826ed00de4253bdea096c78f90c2')

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
