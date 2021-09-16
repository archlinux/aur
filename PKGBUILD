# Maintainer: xeruf <27f at pm dot me>
_pkgname=chordpro
pkgname="${_pkgname}-dev-git"
pkgver=r1198.12d6d39
pkgrel=1
pkgdesc='Reference implementation of the ChordPro standard for musical lead sheets, development branch'
arch=('any')
url="https://github.com/ChordPro/chordpro/tree/dev"
license=('Artistic2.0')
provides=("$_pkgname")
conflicts=("$_pkgname-git")
optdepends=(perl-text-layout)
depends=(git perl-app-packager perl-string-interpolate-named perl-font-ttf perl-image-info perl-io-string perl-json-pp perl-pdf-api2 perl-file-loadlines perl-pod-parser)
options=('!emptydirs' purge)
source=("git+https://github.com/ChordPro/chordpro.git#branch=dev")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  /usr/bin/make
}

check() {
  cd "$_pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$_pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR=$pkgdir/
  #/usr/bin/find ${startdir}/pkg -name '.packlist' -delete
  #/usr/bin/find ${startdir}/pkg -name '*.pod' -delete
}

