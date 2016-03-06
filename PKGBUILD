# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-inline-scheme-guile
pkgver=0.1
pkgrel=1
pkgdesc="Use Guile Scheme code and libraries in your Perl 6 code"
arch=('i686' 'x86_64')
depends=('guile' 'perl6')
checkdepends=('perl')
makedepends=('alacryd' 'git' 'perl6-librarymake' 'pkg-config')
groups=('perl6')
url="https://github.com/drforr/perl6-Inline-Scheme-Guile"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/drforr/perl6-Inline-Scheme-Guile)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./configure.pl6
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
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' \;
}
