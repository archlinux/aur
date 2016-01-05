# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-inline-perl5
pkgver=0.3
pkgrel=1
pkgdesc="Use Perl 5 code in a Perl 6 program"
arch=('i686' 'x86_64')
depends=('perl' 'perl6')
checkdepends=('perl6-file-temp')
makedepends=('alacryd' 'gcc' 'git' 'make' 'perl6-librarymake')
groups=('perl6')
url="https://github.com/niner/Inline-Perl5"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/niner/Inline-Perl5)
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
  _precomp=($(pacman -Qg perl6 \
    | awk '{print $2}' \
    | xargs pacman -Ql \
    | awk '{print $2}' \
    | grep precomp))
  for _pc in "${_precomp[@]}"; do
    [[ -f "$pkgdir/$_pc" ]] && rm -f "$pkgdir/$_pc"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' \;
}
