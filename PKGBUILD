# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-infer
pkgver=0.0.4
pkgrel=1
pkgdesc="Infer Perl 6 Classes from JSON input"
arch=('any')
depends=('perl6'
         'perl6-http-useragent'
         'perl6-json-class'
         'perl6-json-name'
         'perl6-json-tiny')
checkdepends=('perl' 'perl6-test-meta')
makedepends=('alacryd' 'git')
groups=('perl6')
url="https://github.com/jonathanstowe/JSON-Infer"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/jonathanstowe/JSON-Infer)
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing tests...'
  sed -i 's/JSON::Fast/JSON::Tiny/' t/020-attribute.t
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
