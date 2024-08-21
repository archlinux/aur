# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="itex2mml"
_pkgname="perl-${_name}"
pkgname="${_pkgname}-bzr"
pkgver=r85
pkgrel=1
pkgdesc="Perl bindings for ${_name}"
arch=('x86_64')
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=('custom:GPL-unknown-version' 'custom:LGPL-unknown-version' 'custom:MPL-unknown-version'
         'Artistic-1.0-Perl')
makedepends=('bzr')
depends=('glibc' 'perl')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
options=('!emptydirs' 'purge')
_pkgsrc="${_name}"
source=("${_pkgsrc}::bzr+https://golem.ph.utexas.edu/~distler/code/itexToMML")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "${srcdir}/${_pkgsrc}/itex-src/perl"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}/itex-src/perl"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${_pkgsrc}/itex-src/perl"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
