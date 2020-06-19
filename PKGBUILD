# Maintainer: David Birks <david@birks.dev>
# Contributor: Mike Williamson <mike at korora dot ca>

pkgname=eksctl
pkgdesc='Command line tool for creating clusters on Amazon EKS'
pkgver=0.22.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/weaveworks/eksctl'
depends=('kubectl')
makedepends=('go')
conflicts=('eksctl-bin')
source=("$pkgname-${pkgver/_/-}.tar.gz::https://github.com/weaveworks/eksctl/archive/${pkgver/_/-}.tar.gz")
sha256sums=('3d7a4c1f283eaed729c06831113aedc329475774cbd09add4f0f61d6d82ee980')

build() {
  # Trim PWD from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-${pkgver/_/-}
  go build -ldflags="-X github.com/weaveworks/eksctl/pkg/version.gitTag=$pkgver/_/-}" ./cmd/eksctl
}

package() {
  install -Dm 755 "$srcdir/$pkgname-${pkgver/_/-}/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Add command completion
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  install -dm 755 "$pkgdir/usr/share/fish/completions"
  "$pkgdir/usr/bin/eksctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/eksctl"
  "$pkgdir/usr/bin/eksctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_eksctl"
  "$pkgdir/usr/bin/eksctl" completion fish > "$pkgdir/usr/share/fish/completions/eksctl.fish"
}
