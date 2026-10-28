# Maintainer: Kareem Khazem <karkhaz at karkhaz dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: aksr <aksr at t-com dot me>

pkgname=mblaze
pkgver=1.4
pkgrel=1
pkgdesc="Unix utilities to deal with Maildir"
arch=('x86_64')
url="https://github.com/leahneukirchen/mblaze"
license=('custom:publicdomain')
depends=('bash' 'gawk')
makedepends=('git')
conflicts=('santoku')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')

## GPG key located at https://leahneukirchen.org/infopage.html
validpgpkeys=('E6F6848A1B95EE313CF5B7EE95FF633C90A8F025')

prepare() {
  cd "$pkgname"
  git checkout "v$pkgver"
}

build() {
  cd "$pkgname"
  make
}

check() {
  cd "$pkgname"
  make -k check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README VIOLATIONS.md -t "$pkgdir/usr/share/doc/$pkgname/"

  # zsh completions
  install -Dm644 contrib/_mblaze -t "$pkgdir/usr/share/zsh/site-functions/"

  find contrib filter.example mlesskey.example \
    -type f \
    -exec install -Dm644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
}
