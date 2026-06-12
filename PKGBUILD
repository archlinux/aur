# Maintainer: Stanko K.R. <stanko@stanko.io>
# Template for the AUR -bin package. `make release-aur` fills in the
# @PLACEHOLDER@ values and pushes the result to the AUR.
pkgname=voyager-disco-bin
_binname=voyager-disco
pkgver=0.4.0
pkgrel=1
pkgdesc="Control RGB LEDs on ZSA keyboards (Voyager, Moonlander, ErgoDox EZ) without Keymapp (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/monorkin/voyager-disco"
license=('MIT')
depends=('glibc' 'systemd-libs')
provides=('voyager-disco')
conflicts=('voyager-disco')
install=voyager-disco.install
source=('50-zsa.rules'
        'LICENSE')
source_x86_64=("$_binname-$pkgver::$url/releases/download/v$pkgver/$_binname-linux-amd64")
source_aarch64=("$_binname-$pkgver::$url/releases/download/v$pkgver/$_binname-linux-arm64")
sha256sums=('e9f20d846ef6f72937022fa7e2925fbb31a82592ca17f99345a5a6160aa9b64c'
            '9bf2f78d51a124633986efb2cb15197f490ba98af743b12546c182a052a926dc')
sha256sums_x86_64=('30f5d1ad4b3a8bc5fae58ff2ee932d0e3bebc603263d8140f9ade333fd3fa9ec')
sha256sums_aarch64=('87a9b6cdc768d71913ec8f33c5ff532daa5005bffc3283b047f8d29f8d39e968')

build() {
  chmod +x "$_binname-$pkgver"
  "./$_binname-$pkgver" completions bash > completions.bash
  "./$_binname-$pkgver" completions zsh > completions.zsh
  "./$_binname-$pkgver" completions fish > completions.fish
}

package() {
  install -Dm755 "$_binname-$pkgver" "$pkgdir/usr/bin/$_binname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 50-zsa.rules "$pkgdir/usr/lib/udev/rules.d/50-zsa.rules"
  install -Dm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/$_binname"
  install -Dm644 completions.zsh "$pkgdir/usr/share/zsh/site-functions/_$_binname"
  install -Dm644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_binname.fish"
}
