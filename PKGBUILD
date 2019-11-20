# Maintainer: David Birks <david@tellus.space>
# Contributor: Mike Williamson <mike at korora dot ca>

pkgname=eksctl
pkgdesc='Command line tool for creating clusters on Amazon EKS'
pkgver=0.10.2
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/weaveworks/eksctl'
depends=('kubectl')
makedepends=('go')
conflicts=('eksctl-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/weaveworks/eksctl/archive/$pkgver.tar.gz")
sha256sums=('b980fda4a9899e2e2f3606332059201b67b79c78069457febfff3e8fc812206e')

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
