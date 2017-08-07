# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-lmdb
pkgver=0.0.1
pkgrel=2
pkgdesc="Native bindings for OpenLDAP's LMDB library"
arch=('any')
depends=('lmdb' 'perl6')
checkdepends=('perl' 'perl6-file-temp')
makedepends=('git')
groups=('perl6')
url="https://github.com/salortiz/p6-LMDB"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/salortiz/p6-LMDB)
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing liblmdb path...'
  sed -i '/^constant LIB/s/,\sv0\.0\.0//' lib/LMDB.pm6
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
