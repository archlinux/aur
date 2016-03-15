# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=alacryd
pkgver=0.1.1
pkgrel=2
pkgdesc="Expedient Perl6 module installation"
arch=('any')
depends=('perl6')
groups=('perl6')
url="https://github.com/atweiden/alacryd"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('a933f1837ee934b521516930ba3eee25c241b8bb718e58d6a47b6c90e48cab74')
install=alacryd.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/alacryd"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/alacryd"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/perl6/vendor"
  export RAKUDO_LOG_PRECOMP=1
  PERL6LIB=lib perl6 \
    -I"inst#$pkgdir/usr/share/perl6/vendor" \
    -MAlacryd -e 'install()'

  msg2 'Removing redundant precomp file dependencies...'
  _precomp=($(pacman -Qqg perl6 | pacman -Qql - | grep -E 'dist|precomp' || true))
  for _pc in "${_precomp[@]}"; do
    [[ -f "$pkgdir/$_pc" ]] && rm -f "$pkgdir/$_pc"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' \;
}
