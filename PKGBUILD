# Maintainer: Loodse <aur@loodse.com>

pkgname=kubeone
pkgver=0.10.0
pkgrel=1
pkgdesc="A lifecycle management tool for Highly-Available Kubernetes clusters"
url="https://www.kubeone.io"
arch=("x86_64")
license=("Apache")
makedepends=("go")
optdepends=("terraform: sourcing data about infrastructure and control plane nodes")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubermatic/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('14f070efe3505ca453623206a57c152516cf1292170f4face682388bae97386d3e07177b497328768cc8ad89e1a67d71c41ea22e55279ac7f546842206f5c71d')

build() {
  cd "kubeone-$pkgver"
  export GOFLAGS="-mod=readonly -trimpath -asmflags=all=-trimpath=$PWD -ldflags=\"-extldflags=$LDFLAGS\""
  make build
}

check() {
  cd "kubeone-$pkgver"
  export GOFLAGS="-mod=readonly -trimpath -asmflags=all=-trimpath=$PWD -ldflags=\"-extldflags=$LDFLAGS\""
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

  mkdir -p "$pkgdir"/usr/share/bash-completion/completions
  ./dist/$pkgname completion bash > "$pkgdir"/usr/share/bash-completion/completions/$pkgname
}
