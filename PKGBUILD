# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-method-modifiers
pkgver=0.0.1
pkgrel=1
pkgdesc="Adds before, after and around functions to modify class methods similar to p5 Moose"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('alacryd' 'git')
groups=('perl6')
url="https://github.com/supernovus/perl6-method-modifiers"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/supernovus/perl6-method-modifiers)
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing monkey typing...'
  sed -i 's/MONKEY_TYPING/MONKEY-TYPING/' lib/Method/Modifiers/Augment.pm6
  sed -i 's/skip_rest/skip-rest/' t/02-augment.t
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
  find "$pkgdir" -type f -print0 | xargs -0 sed -i "s,$pkgdir,,g"
}
