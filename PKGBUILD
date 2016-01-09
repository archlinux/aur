# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=panda
pkgver=0.1
pkgrel=1
pkgdesc="Perl6 module installer"
arch=('any')
depends=('curl'
         'perl6'
         'perl6-file-find'
         'perl6-json-fast'
         'perl6-shell-command')
checkdepends=('perl')
makedepends=('alacryd' 'git')
optdepends=('wget: download metadata files with wget')
groups=('perl6')
url="https://github.com/tadzik/panda"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/tadzik/panda)
sha256sums=('SKIP')
conflicts=('perl6-panda')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 {CONTRIBUTING,README}.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/perl6/vendor"
  export PERL6LIB="inst#$pkgdir/usr/share/perl6/vendor"
  alacryd install

  msg2 'Removing redundant precomp file dependencies...'
  _precomp=($(pacman -Qg perl6 \
    | awk '{print $2}' \
    | xargs pacman -Ql \
    | awk '{print $2}' \
    | grep -E 'dist|precomp|short'))
  for _pc in "${_precomp[@]}"; do
    [[ -f "$pkgdir/$_pc" ]] && rm -f "$pkgdir/$_pc"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' \;
  find "$pkgdir" -type f -print0 | xargs -0 sed -i "s,$pkgdir,,g"
}
