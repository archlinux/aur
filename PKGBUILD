# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-control-bail
pkgver=0.0.1
pkgrel=1
pkgdesc="Perl6 module for deferred error handling"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('alacryd' 'git')
groups=('perl6')
url="https://github.com/skids/perl6-Control-Bail"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/skids/perl6-Control-Bail
        META6.json.diff::https://github.com/atweiden/perl6-Control-Bail/commit/d21914efefa122fcc9e22bcc87c0f2b0d36c893b.diff)
sha256sums=('SKIP'
            'cd17172632d1a9773955f627a168ed1746476a6e75028071f355490a1b21e315')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing META6.json...'
  git apply "$srcdir/META6.json.diff"
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
}
