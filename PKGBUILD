# Maintainer: FLX (Paul Werther) <flx@evait.de>

pkgname=hash-sentinel
pkgver=latest.r2.g365b18c
pkgrel=1
pkgdesc="A tool for quickly identifying users in Active Directory who share identical NT hashes (passwords)"
arch=('x86_64')
url="https://github.com/evait-security/hash-sentinel"
license=('MIT')
depends=()
makedepends=('crystal' 'shards' 'git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  shards install
  crystal build --release src/hash_sentinel.cr -o hash-sentinel
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 hash-sentinel "$pkgdir/usr/bin/hash-sentinel"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # If there's a LICENSE file, install it
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
