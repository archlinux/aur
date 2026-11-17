# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>
pkgname=tmail-bin
_pkgname=tmail
pkgver=1.0.5
pkgrel=1
pkgdesc='A fast terminal email client with a spatial conversation map (IMAP/SMTP, Maildir) - prebuilt binary'
arch=('x86_64' 'aarch64')
url='https://github.com/tuna4ll/tmail'
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=('gnupg: message signing and encryption'
  'gnome-keyring: password storage in the system keyring'
  'kitty: inline images in HTML mail'
  'wezterm: inline images in HTML mail')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/tuna4ll/tmail/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('43808caf40d62fe06147fce77a1825d8952cc28340a72c2c3c5164559a74a585')
sha256sums_x86_64=('7b2d3245082bb45925164bd100a34412a530062bcca53cb5e1bc48fe94b2e6ee')
sha256sums_aarch64=('b12ea9a38b5f99b54e95af57bdc89746f48c92f97583a94f58635c1c647f4877')

package() {
  # The binary may sit at the archive root or in a subfolder; find it either way
  local bin
  bin="$(find "$srcdir" -type f -name "$_pkgname" -perm -u+x | head -n1)"
  [[ -n "$bin" ]] || bin="$(find "$srcdir" -type f -name "$_pkgname" | head -n1)"

  install -Dm755 "$bin" "$pkgdir/usr/bin/$_pkgname"

  # Man page and shell completions come from the binary itself
  "$pkgdir/usr/bin/$_pkgname" man | install -Dm644 /dev/stdin "$pkgdir/usr/share/man/man1/$_pkgname.1"
  "$pkgdir/usr/bin/$_pkgname" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  "$pkgdir/usr/bin/$_pkgname" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  "$pkgdir/usr/bin/$_pkgname" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"

  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
