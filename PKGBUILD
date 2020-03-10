# Maintainer: Loodse <aur@loodse.com>

pkgname=kubeone
pkgver=0.11.0
pkgrel=1
pkgdesc="A lifecycle management tool for Highly-Available Kubernetes clusters"
url="https://www.kubeone.io"
arch=("x86_64")
license=("Apache")
makedepends=("go")
optdepends=("terraform: sourcing data about infrastructure and control plane nodes")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubermatic/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('83591999eb05f4d05d98ab8ea8b323eb2cd0bfd80311b2fee39a30b7515657681c3fd8c1deef1bea76ec2de61aff8f0308db9763615c3415dd43f214a63c2be9')

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
