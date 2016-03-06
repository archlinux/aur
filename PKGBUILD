# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-crust
pkgver=0.0.1
pkgrel=1
pkgdesc="Perl6 Superglue for Web frameworks and Web Servers"
arch=('any')
depends=('perl6'
         'perl6-apache-logformat'
         'perl6-backtrace-ashtml'
         'perl6-base64'
         'perl6-cookie-baker'
         'perl6-fastcgi-nativecall'
         'perl6-fastcgi-nativecall-psgi'
         'perl6-file-temp'
         'perl6-getopt-tiny'
         'perl6-hash-multivalue'
         'perl6-http-easy'
         'perl6-http-multipartparser'
         'perl6-http-server-tiny'
         'perl6-http-useragent'
         'perl6-uri')
checkdepends=('perl')
makedepends=('alacryd' 'git')
groups=('perl6')
url="https://github.com/tokuhirom/p6-Crust"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/tokuhirom/p6-Crust)
sha256sums=('SKIP')

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
  _precomp=($(pacman -Qqg perl6 | pacman -Qql - | grep -E 'dist|precomp' || true))
  for _pc in "${_precomp[@]}"; do
    [[ -f "$pkgdir/$_pc" ]] && rm -f "$pkgdir/$_pc"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' \;
  find "$pkgdir" -type f -print0 | xargs -0 sed -i "s,$pkgdir,,g"
}
