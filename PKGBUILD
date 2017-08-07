# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-crypt-argon2
pkgver=0.2.0
pkgrel=2
pkgdesc="Easy Argon2 password hashing and key derivation in Perl6"
arch=('i686' 'x86_64')
depends=('perl6' 'perl6-crypt-random')
checkdepends=('perl')
makedepends=('git' 'make')
groups=('perl6')
url="https://github.com/skinkade/p6-crypt-argon2"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/skinkade/p6-crypt-argon2)
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # from Build.pm, to avoid makedepends+=('panda' 'perl6-librarymake')
  _extdir=$(find ext/ -mindepth 1 -maxdepth 1 -type d -name "argon2*")
  _resdir=resources/libraries
  _so=$(perl6 -e 'say $*VM.config<dll>.subst(/^.*\%s(.*)/, -> $/ { "$0" })')
  _make=$(perl6 -e 'say $*VM.config<make>')

  msg2 'Building libargon2...'
  mkdir -p $_resdir
  pushd $_extdir
  $_make libs
  popd
  mv $_extdir/libargon2$_so $_resdir
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
}
