# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=alacryd
pkgver=0.1.3
pkgrel=1
pkgdesc="Expedient Perl6 module installation"
arch=('any')
depends=('perl6')
makedepends=('git')
groups=('perl6')
url="https://github.com/atweiden/alacryd"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver
        git+https://github.com/timo/json_fast)
sha256sums=('60990d71239741cf93b6fa85805c6c53118f239f73b0a1881f84cbcd3600b9aa'
            'SKIP')
install=alacryd.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Copying JSON::Fast into lib for bootstrapping...'
  find "$srcdir/json_fast/lib" -exec cp -dpr --no-preserve=ownership '{}' lib \;
}

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
  find "$pkgdir" -type f -print0 | xargs -0 sed -i "s,$pkgdir,,g"
  find "$pkgdir" -type f -print0 | xargs -0 sed -i "s,$srcdir,,g"
}
