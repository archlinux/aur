# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-name
_p6name=JSON-Name
pkgver=0.0.2
pkgrel=1
pkgdesc="Provides a trait to store an alternative JSON Name"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('alacryd' 'git')
groups=('perl6')
url="https://github.com/jonathanstowe/JSON-Name"
license=('PerlArtistic')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jonathanstowe/$_p6name/tar.gz/v$pkgver)
sha256sums=('52ef61e99d49282d1a657c2581ae83f3dffacab2d7a41ea22fbbc28b2233747a')

check() {
  cd "$srcdir/$_p6name-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$_p6name-$pkgver"

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
