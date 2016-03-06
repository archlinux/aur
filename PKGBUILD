# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-inline-ruby
pkgver=0.1.1
pkgrel=1
pkgdesc="Use Ruby code and libraries in a Perl 6 program"
arch=('i686' 'x86_64')
depends=('perl6' 'ruby')
checkdepends=('perl')
makedepends=('alacryd' 'gcc' 'git' 'make' 'perl6-librarymake')
groups=('perl6')
url="https://github.com/awwaiid/p6-Inline-Ruby"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/awwaiid/p6-Inline-Ruby)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  perl6 configure.pl6
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  make test
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
  find "$pkgdir" -type f -print0 | xargs -0 sed -i "s,$pkgdir,,g"
}
