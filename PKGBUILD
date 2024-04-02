# Maintainer: Martin Rodriguez Reboredo <yakoyoku@gmail.com>

pkgname=arduino-fwuploader
pkgver=2.4.1
pkgrel=1
pkgdesc="Update the firmware or add SSL certificates for any Arduino with WINC or NINA Wi-Fi"
arch=('x86_64')
url="https://github.com/arduino/arduino-fwuploader"
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
optdepends=('arduino-cli: Arduino command line interface')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('39eea32d68a34db8f1442b7159d376b2acd2cad92eb887eb0875525e97990de5392700ebb936ceac4e9e29a3aa27307c358182296054291b9ac089a7ee6e6c09')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" .
  ./"$pkgname" completion bash > "$srcdir/$pkgname.bash"
  ./"$pkgname" completion fish > "$srcdir/$pkgname.fish"
  ./"$pkgname" completion zsh > "$srcdir/$pkgname.zsh"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"

  install -Dm 644 "$srcdir/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm 644 "$srcdir/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm 644 "$srcdir/$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
