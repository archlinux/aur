# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-name
_p6name=JSON-Name
pkgver=0.0.1
pkgrel=2
pkgdesc="Provides a trait to store an alternative JSON Name"
arch=('any')
depends=('rakudo')
checkdepends=('perl')
makedepends=('alacryd' 'git')
groups=('perl6')
url="https://github.com/jonathanstowe/JSON-Name"
license=('PerlArtistic')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jonathanstowe/$_p6name/tar.gz/v$pkgver)
sha256sums=('eb4ed029d0765b3c73b675ebd5f70a0714c1da4fc3fd68f1f6d7b5c83cebba31')

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
