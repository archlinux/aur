# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-digest-xxhash
pkgver=1.1.0
pkgrel=1
pkgdesc="Perl 6 bindings for xxHash"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git' 'make')
groups=('perl6')
url="https://github.com/atweiden/digest-xxhash"
license=('UNLICENSE')
source=($pkgname-$pkgver::git+https://github.com/atweiden/digest-xxhash)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  export PERL6LIB=lib
  perl6 -MDigest::xxHash::BuildTools -e 'Digest::xxHash::BuildTools.new.build'
  perl6 -MDigest::xxHash::BuildTools -e 'Digest::xxHash::BuildTools.new.install'
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.

  # XXX not working
  msg2 'Cleaning up $pkgdir references...'
  find "$pkgdir" -type f -exec sed -i "s,$pkgdir,,g" '{}' \;
}
