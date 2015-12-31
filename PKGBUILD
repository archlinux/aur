# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-debugger-ui-commandline
pkgver=0.0.1
pkgrel=4
pkgdesc="Command-line debugger frontend for Rakudo"
arch=('any')
depends=('rakudo' 'perl6-terminal-ansicolor')
makedepends=('alacryd' 'git')
groups=('perl6')
url="https://github.com/jnthn/rakudo-debugger"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/jnthn/rakudo-debugger)
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.markdown -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/perl6/vendor"
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
