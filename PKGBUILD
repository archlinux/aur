# Maintainer: web.de jan.stuehler
pkgname=chordpro
pkgbase=chordpro-git
pkgver=1
pkgrel=1
pkgdesc='Reference implementation of the ChordPro standard for musical lead sheets.'
arch=('i686' 'x86_64')
url="https://github.com/ChordPro/chordpro"
license=('PerlArtistic')
makedepends=('git')
depends=(perl)
options=('!emptydirs' purge)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgbase"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  /usr/bin/make
}

check() {
  cd "$pkgbase"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$pkgbase"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=site DESTDIR=$pkgdir/
  /usr/bin/find $startdir/pkg -name '.packlist' -delete
  /usr/bin/find $startdir/pkg -name '*.pod' -delete
}

