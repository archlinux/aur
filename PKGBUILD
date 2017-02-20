# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-grammar-debugger
pkgver=0.0.1
pkgrel=5
pkgdesc="Simple tracing and debugging support for Perl 6 grammars"
arch=('any')
depends=('perl6' 'perl6-terminal-ansicolor')
checkdepends=('perl')
makedepends=('alacryd' 'git')
groups=('perl6')
url="https://github.com/jnthn/grammar-debugger"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/jnthn/grammar-debugger)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.markdown -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/perl6/vendor"
  export RAKUDO_LOG_PRECOMP=1
  export PERL6LIB="inst#$pkgdir/usr/share/perl6/vendor"
  alacryd install

  msg2 'Removing redundant precomp file dependencies...'
  _precomp=($(pacman -Qqg perl6 | pacman -Qql - | grep -E 'dist|precomp' || true))
  for _pc in "${_precomp[@]}"; do
    [[ -f "$pkgdir/$_pc" ]] && rm -f "$pkgdir/$_pc"
  done

  msg2 'Cleaning up pkgdir...'
  rm -f "$pkgdir/usr/share/perl6/vendor/version"
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' +
  find "$pkgdir" -type f -print0 -exec \
    sed -i -e "s,$pkgdir,,g" -e "s,$srcdir,,g" '{}' +
}
