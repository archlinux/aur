# Maintainer: web.de jan.stuehler
_pkgname=chordpro
_author="Johan Vromans"
pkgname=chordpro-dev-git
pkgbase=chordpro-dev-git
pkgver=r1198.12d6d39
pkgrel=1
pkgdesc='Reference implementation of the ChordPro standard for musical lead sheets, dev branch'
arch=('any')
url="https://github.com/ChordPro/chordpro"
license=('Artistic2.0')
provides=($pkgname)
conflicts=(chordpro-git)
optdepends=()
depends=(git perl-string-interpolate-named perl-font-ttf perl-image-info perl-io-string perl-json-pp perl-pdf-api2 perl-app-packager perl-file-loadlines perl-text-layout perl-pdf-builder)
options=('!emptydirs' purge)
#source=("git+${url}.git#branch=dev")
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

