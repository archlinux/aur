# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=not-forking
pkgver=r114.dc62bca
pkgrel=3
pkgdesc='Integrate non-diffable codebases, like patch/sed/diff/cp/mv rolled into one.'
arch=('any')
url="https://lumosql.org/src/not-forking"
license=('custom: MIT' 'custom: cc-by-sa-4.0')
depends=('perl')
makedepends=('fossil')
checkdepends=('perl-text-glob')
options=('!emptydirs' 'purge')
source=("${pkgname}::fossil+${url}#commit=dc62bca18c84ddf8")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}

build() {
  cd "$pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

  install -Dm644 LICENCES/MIT.txt "${pkgdir}/usr/share/licenses/${pkgname}/MIT.txt"
  install -Dm644 LICENCES/CC-by-SA-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/CC-by-SA-4.0.txt"
}
