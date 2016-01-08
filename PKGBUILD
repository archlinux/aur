# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mktxn
pkgver=0.0.1
pkgrel=1
pkgdesc="Double-entry bookkeeping transaction journal parser and serializer"
arch=('any')
depends=('perl6'
         'perl6-config-toml'
         'perl6-digest-xxhash'
         'perl6-json-tiny')
checkdepends=('perl')
makedepends=('alacryd' 'git')
groups=('perl6' 'nightscape')
url="https://github.com/atweiden/mktxn"
license=('UNLICENSE')
source=($pkgname-$pkgver::git+https://github.com/atweiden/mktxn)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

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
