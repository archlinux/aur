# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=cro
pkgver=0.7.3
pkgrel=1
pkgdesc="Development tools for building services and distributed systems in Perl 6 using the Cro libraries"
arch=('any')
depends=('perl6'
         'perl6-cro-websocket'
         'perl6-docker-file'
         'perl6-file-find'
         'perl6-io-socket-async-ssl'
         'perl6-json-fast'
         'perl6-meta6'
         'perl6-oo-monitors'
         'perl6-shell-command'
         'perl6-terminal-ansicolor'
         'perl6-yamlish')
checkdepends=('perl')
makedepends=('git')
groups=('croservices' 'perl6')
url="https://github.com/croservices/cro"
license=('PerlArtistic')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/croservices/${pkgname##perl6-}/tar.gz/release-$pkgver)
sha256sums=('d6dd5b7e17be1ae266cb291dcb7a4439cc7b82116f862c7e396f8c5de7295c42')

check() {
  cd "$srcdir/${pkgname##perl6-}-release-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6 t/
}

package() {
  cd "$srcdir/${pkgname##perl6-}-release-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -dpr --no-preserve=ownership docs "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
