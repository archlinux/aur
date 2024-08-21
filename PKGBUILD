# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="itex2mml"
pkgname="perl-${_name}"
pkgver=1.6.1
pkgrel=1
pkgdesc="Perl bindings for ${_name}"
arch=('x86_64')
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=('custom:GPL-unknown-version' 'custom:LGPL-unknown-version' 'custom:MPL-unknown-version'
         'Artistic-1.0-Perl')
depends=('glibc' 'perl')
options=('!emptydirs' 'purge')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::http://golem.ph.utexas.edu/~distler/blog/files/itexToMML.tar.gz")
noextract=("${_pkgsrc}.tar.gz")
sha256sums=('3ef2572aa3421cf4d12321905c9c3f6b68911c3c9283483b7a554007010be55f')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.tar.gz" --strip-components 1 -C "${srcdir}/${_pkgsrc}"
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

  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
