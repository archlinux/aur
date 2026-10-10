# Maintainer: bromigOS <packages@bromigos.org>
# Contributor: blackflame
pkgname=bromigos-keyring
pkgver=0.0.0.r3.g6f8c6e3
pkgrel=1
pkgdesc='bromigOS package-signing key for pacman'
arch=('any')
depends=('pacman' 'bromigos-mirrorlist')
makedepends=('gnupg')
install=bromigos-keyring.install
options=('!debug')
url='https://github.com/bromigos-org/bromigOS'
license=('MIT OR Apache-2.0')
_tag=aur-bootstrap-6f8c6e3cc345
source=("bromigos-$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('ea499760a23c382614c268f6059c78199ba3406a478fe86370cfa778722da0db')
_source_root() { printf '%s' "$srcdir/bromigOS-${_tag#v}"; }

build() {
  _root=$(_source_root)
  local tmp
  tmp=$(mktemp -d)
  GNUPGHOME="$tmp" gpg --batch --quiet --import "$_root/packaging/keys/bromigos.asc"
  GNUPGHOME="$tmp" gpg --batch --with-colons --list-keys |
    awk -F: '/^pub:/ { p = 1; next } /^fpr:/ && p { print $10 ":4:"; p = 0 }' > "$srcdir/bromigos-trusted"
  GNUPGHOME="$tmp" gpg --batch --export > "$srcdir/bromigos.gpg"
  gpgconf --homedir "$tmp" --kill all 2>/dev/null || true
  rm -rf "$tmp"
  test -s "$srcdir/bromigos-trusted"
}
package() {
  _root=$(_source_root)
  install -Dm644 -t "$pkgdir/usr/share/pacman/keyrings/" "$srcdir/bromigos.gpg" "$srcdir/bromigos-trusted"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_root/LICENSE-MIT" "$_root/LICENSE-APACHE"
}
