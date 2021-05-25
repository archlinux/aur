# Maintainer: PhotonX <michael dot kogan at gmx dot net>

pkgname=perl-gtk3-imageview-shutter
_pkgname=perl-gtk3-imageview
_perl_namespace=Gtk3
_perl_module=ImageView
pkgver=9
pkgrel=2
pkgdesc="Image viewer widget for Gtk3, recent version with fixes required for Shutter"
arch=('any')
url="https://metacpan.org/release/${_perl_namespace}-${_perl_module}"
license=('LGPL')
depends=('perl-gtk3' 'imagemagick')
conflicts=('perl-gtk3-imageview')
provides=('perl-gtk3-imageview=9')
checkdepends=('perl-test-exception' 'perl-test-deep' 'perl-test-memory-cycle' 'perl-try-tiny'
              'perl-readonly' 'perl-test-mockobject' 'perl-test-differences'
              'perl-carp-always' 'xorg-server-xvfb')
source=("https://cpan.metacpan.org/authors/id/A/AS/ASOKOLOV/${_perl_namespace}-${_perl_module}-${pkgver}.tar.gz")
sha512sums=('1a52c53a03b6f9dd6abc69dbb03a8dd80df77e266eb972cb2438bd25d49765b203a70e2dfee1ae3cfdd27b4d987f9573eef3e47968c80550771dd3edbcf831cc')
options=('!emptydirs')

build() {
  cd "${_perl_namespace}-${_perl_module}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
}

check() {
  cd "${_perl_namespace}-${_perl_module}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make test
}

package() {
  cd "${_perl_namespace}-${_perl_module}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  # Delete unuseful files
  find "${pkgdir}" -name '.packlist' -delete
}