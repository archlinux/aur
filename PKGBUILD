# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>
pkgname=tmail-bin
_pkgname=tmail
pkgver=1.0.4
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
sha256sums_x86_64=('d49fb0afcb4ec0559d0c28a2bdcb9a735ffb176860baa06248d04de52a0f650d')
sha256sums_aarch64=('208a3bda4a17b6f65fb7e38748c74573c9ddd67adbd63250096153c2494db30e')

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
