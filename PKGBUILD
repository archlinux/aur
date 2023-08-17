# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-digest
pkgver=1.0.1
_gitref=f71ccf9525d5be5b552d9ee7e76f9a19e51afc02  # untagged version 1.0.1
pkgrel=3
pkgdesc="Raku implementation of some digest algorithms (can use OpenSSL's digests via nativecall)"
arch=('any')
url='https://raku.land/zef:grondilu/Digest'
_reponame='libdigest-raku'
_repourl="https://github.com/grondilu/${_reponame}"
license=('Artistic2.0')
groups=(
  'perl6'
  'raku'
)
depends=('rakudo')
makedepends=('git')
checkdepends=(
  'openssl>=3.0.0'
  'perl'
)
optdepends=('openssl>=3.0.0: use nativecall by setting envvar DIGEST_METHOD=openssl')
provides=(
  'raku-digest'
  {perl6,raku}'-hmac'
  {perl6,raku}'-digest-md5'
  {perl6,raku}'-digest-ripemd'
  {perl6,raku}'-digest-sha1'
  {perl6,raku}'-digest-sha2'
  {perl6,raku}'-digest-sha3'
)
conflicts=("${provides[@]}")
source=("${_reponame}::git+$_repourl.git#commit=${_gitref}")
b2sums=('SKIP')

check() {
  cd "$srcdir/${_reponame}"

  echo '-- Running tests (Raku digests)...'
  PERL6LIB=lib prove -v -e "raku -I." t/
  echo
  echo '-- Running tests (OpenSSL digests)...'
  PERL6LIB=lib DIGEST_METHOD=openssl prove -v -e "raku -I." t/
}

package() {
  cd "$srcdir/${_reponame}"

  echo 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  echo 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
