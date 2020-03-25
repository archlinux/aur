# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=pulumi
pkgver=1.13.0
pkgrel=3
pkgdesc='Modern Infrastructure as Code'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('46c767d7ae155fe3c67024d0a5defec800bdf9b98d5e9ba2cc5ff6859b40deac')

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

  # Generate Bash completion
  install -d -m 755 "$pkgdir/etc/bash_completion.d"
  install -m644 <("$pkgdir/usr/bin/$pkgname" gen-completion bash) "$pkgdir/etc/bash_completion.d/$pkgname"

  # Generate ZSH completion
  install -d -m 755 "$pkgdir/usr/share/zsh/site-functions"
  install -m644 <("$pkgdir/usr/bin/$pkgname" gen-completion zsh) "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

# vim:set ts=2 sw=2 et:
