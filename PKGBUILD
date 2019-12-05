# Maintainer: David Birks <david@tellus.space>
# Contributor: Mike Williamson <mike at korora dot ca>

pkgname=eksctl
pkgdesc='Command line tool for creating clusters on Amazon EKS'
pkgver=0.11.1
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/weaveworks/eksctl'
depends=('kubectl')
makedepends=('go')
conflicts=('eksctl-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/weaveworks/eksctl/archive/$pkgver.tar.gz")
sha256sums=('8ad5b7ad7503609a593000f69e0fc45336e5512337599e7014f1b4e287d7d37c')

build() {
  # Trim PWD from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build -ldflags="-X github.com/weaveworks/eksctl/pkg/version.gitTag=$pkgver" ./cmd/eksctl
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Add command completion
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/eksctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/eksctl"
  "$pkgdir/usr/bin/eksctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_eksctl"
}
