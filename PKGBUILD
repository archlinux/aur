# Maintainer: Stanko K.R. <stanko@stanko.io>
# Template for the AUR -bin package. `make release-aur` fills in the
# @PLACEHOLDER@ values and pushes the result to the AUR.
pkgname=voyager-disco-bin
_binname=voyager-disco
pkgver=0.5.0
pkgrel=1
pkgdesc="Control RGB LEDs on ZSA keyboards (Voyager, Moonlander, ErgoDox EZ) without Keymapp (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/monorkin/voyager-disco"
license=('MIT')
depends=('glibc' 'systemd-libs')
provides=('voyager-disco')
conflicts=('voyager-disco')
options=('!debug')
install=voyager-disco.install
source=('50-zsa.rules'
        'LICENSE')
source_x86_64=("$_binname-$pkgver::$url/releases/download/v$pkgver/$_binname-linux-amd64")
source_aarch64=("$_binname-$pkgver::$url/releases/download/v$pkgver/$_binname-linux-arm64")
sha256sums=('e9f20d846ef6f72937022fa7e2925fbb31a82592ca17f99345a5a6160aa9b64c'
            '9bf2f78d51a124633986efb2cb15197f490ba98af743b12546c182a052a926dc')
sha256sums_x86_64=('01085b94444020af1a82ff88de87c2936f137efe0c92e2daf60f668770ae9a46')
sha256sums_aarch64=('8ec15f9ff5faf2f5cfad18d9ff3d0237b1e7f8a4a63d7e76a8bbfa615a63b737')

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
