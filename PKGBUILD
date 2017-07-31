# Maintainer: Márton Szabó <notramo@vipmail.hu>

pkgname=zef-without-alacryd
pkgver=0.1.26
pkgrel=1
pkgdesc="Perl6 Module Manager (without alacryd makedepend)"
arch=('any')
depends=('perl6')
checkdepends=('perl')
groups=('perl6')
provides=('zef')
conflicts=('zef')
url="https://github.com/ugexe/zef"
license=('PerlArtistic')
options=('!purge')
source=(zef-pkgver.tar.gz::https://github.com/ugexe/zef/archive/v$pkgver.tar.gz)
sha256sums=('74ec4f53c88199ccef7a1df3fd24eb6d53a33cc2cf5d25d38456b8705bb50569')

check() {
  cd "$srcdir/zef-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/zef-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.pod -t "$pkgdir/usr/share/doc/zef"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/perl6/vendor"
  export RAKUDO_LOG_PRECOMP=1
  export PERL6LIB="inst#$pkgdir/usr/share/perl6/vendor"
  perl6 -Ilib bin/zef install . --install-to=$pkgdir/usr/share/perl6/vendor


  msg2 'Removing redundant precomp file dependencies...'
  _precomp=($(pacman -Qqg perl6 | pacman -Qql - | grep -E 'dist|precomp' || true))
  for _pc in "${_precomp[@]}"; do
    [[ -f "$pkgdir/$_pc" ]] && rm -f "$pkgdir/$_pc"
  done

  msg2 'Cleaning up pkgdir...'
  rm -f "$pkgdir/usr/share/perl6/vendor/version"
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' +
  find "$pkgdir" -type f -print0 -exec \
    sed -i -e "s,$pkgdir,,g" -e "s,$srcdir,,g" '{}' +
}
