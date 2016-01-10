# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-readline
pkgver=0.0.1
pkgrel=3
pkgdesc="Perl 6 interface to GNU Readline"
arch=('any')
depends=('perl6' 'readline')
checkdepends=('perl')
makedepends=('alacryd' 'git')
groups=('perl6')
url="https://github.com/drforr/perl6-readline"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/drforr/perl6-readline
        META.info.diff)
sha256sums=('SKIP'
            '2b56036382a3dc5e445a855cc1ee4fa1110556317ab41dc10c8586f912830130')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing META.info...'
  git apply "$srcdir/META.info.diff"
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
