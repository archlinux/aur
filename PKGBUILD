# Maintainer: xeyossr (axrona)
# Description: 🔍 View AUR PKGBUILD files quickly in your terminal.

pkgname=pkgview
pkgver=1.0.0
pkgrel=1
pkgdesc="🔍 View AUR PKGBUILD files quickly in your terminal."
arch=('any')
url="https://github.com/axrona/pkgview"
license=('GPL3')
depends=()
makedepends=('go')
optdepends=('vi: Default editor if no EDITOR environment variable is set'
  'nano: Alternative editor'
  'vim: Alternative editor'
  'nvim: Alternative editor'
  'jed: Alternative editor')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/axrona/pkgview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o build/pkgview main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/pkgview "${pkgdir}/usr/bin/${pkgname}"

  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  _bash="$pkgdir/usr/share/bash-completion/completions"
  _fish="$pkgdir/usr/share/fish/vendor_completions.d"
  _zsh="$pkgdir/usr/share/zsh/site-functions"

  install -dm755 "$_bash" "$_fish" "$_zsh"

  ./build/pkgview -v >"$_bash/pkgview"
  ./build/pkgview -v >"$_fish/pkgview.fish"
  ./build/pkgview -v >"$_zsh/_pkgview"
}
