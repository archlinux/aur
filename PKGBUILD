# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=pulumi
pkgver=1.12.1
pkgrel=2
pkgdesc='Modern Infrastructure as Code'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e327782c45a8e845914230fab0fef6ece4404c25b4696660928607f5ebfbb472')

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
  install -Dm755 pulumi "$pkgdir"/usr/bin/pulumi
  for plugin in ${_plugins[*]}; do
    bin=${plugin##*/}
    install -Dm755 $bin "$pkgdir"/usr/bin/$bin
  done
  mkdir -p "$pkgdir"/etc/bash_completion.d
  ./pulumi gen-completion bash > "$pkgdir"/etc/bash_completion.d/pulumi
}

# vim:set ts=2 sw=2 et:
