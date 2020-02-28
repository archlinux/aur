# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=pulumi
pkgver=1.11.1
pkgrel=1
pkgdesc='Pulumi - Modern Infrastructure as Code'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eaf164afa2a32d7851127f917c2a1d692961821ce0dd9118266c662fd67b119c')

_plugins=(
  "sdk/nodejs/cmd/pulumi-language-nodejs"
  "sdk/python/cmd/pulumi-language-python"
  "sdk/dotnet/cmd/pulumi-language-dotnet"
  "sdk/go/pulumi-language-go"
)

build() {
  cd $pkgname-$pkgver

  go build \
    -trimpath \
    -ldflags "-X github.com/pulumi/pulumi/pkg/version.Version=$pkgver -extldflags $LDFLAGS" \
    -o $pkgname .

  for plugin in ${_plugins[*]}; do
    bin=${plugin##*/}
    go build \
      -trimpath \
      -ldflags "-X github.com/pulumi/pulumi/pkg/version.Version=$pkgver -extldflags $LDFLAGS" \
      -o $bin ./$plugin
  done
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  for plugin in ${_plugins[*]}; do
    bin=${plugin##*/}
    install -Dm755 $bin "$pkgdir"/usr/bin/$bin
  done
}

# vim:set ts=2 sw=2 et:
