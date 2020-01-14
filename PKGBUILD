# Maintainer: David Birks <david@tellus.space>

pkgname=aws-iam-authenticator
pkgver=0.4.0
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache')
makedepends=('go')
conflicts=('aws-iam-authenticator-bin' 'aws-iam-authenticator-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/v$pkgver.tar.gz")
sha512sums=('2020ba908268d32bf5b0fa799052b26c37ea27fec6c41948bb090119a1963052b5f736da57a09390cc060bfa0b0717e8ed24d20ed01d828d5d27918117bbd7d0')

prepare(){
  mkdir -p gopath/src/github.com/kubernetes-sigs
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/kubernetes-sigs/$pkgname
  export GOPATH="$srcdir"/gopath

  cd gopath/src/github.com/kubernetes-sigs/$pkgname
  dep ensure -v
}


build() {
  # Trim PWD from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  export GOPATH="$srcdir"/gopath

  cd gopath/src/github.com/kubernetes-sigs/$pkgname
  go build --ldflags "-X main.version=$pkgver" ./cmd/aws-iam-authenticator
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
