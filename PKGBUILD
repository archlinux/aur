# Maintainer: Patryk Kowalczyk < patryk at kowalczyk dot ws>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_author="Daniel P. Berrange"
_perlmod="sys-virt"
pkgname=perl-${_perlmod}
pkgver=3.0.0
pkgrel=1
pkgdesc="Represent and manage a libvirt hypervisor connection"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Sys-Virt/"
license=('GPL' 'PerlArtistic')
depends=('libvirt')
makedepends=('perl-test-pod-coverage' 'perl-xml-xpath')
source=("http://www.cpan.org/authors/id/D/DA/DANBERR/Sys-Virt-${pkgver}.tar.gz")
md5sums=('2d5673dd8929957513f951a63a0ae2b1')

build() {
  cd "${srcdir}/Sys-Virt-${pkgver}"

  # From Fedora spec file - generation of spec file causes make to segfault
  sed -i -e '/Sys-Virt\.spec/d' Makefile.PL
  sed -i -e '/\.spec\.PL$/d' MANIFEST
  rm -f *.spec.PL

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  export MAKEFLAGS='-j1'
  make
}

package() {
  cd "${srcdir}/Sys-Virt-${pkgver}"
  make install DESTDIR="${pkgdir}/"

  # From Fedora RPM spec file - remove empty '.packlist' and '*.bs' files
  find "${pkgdir}" -type f \( -name .packlist -o -name '*.bs' -o -name perllocal.pod -empty \) | xargs rm -vf
  rm -fr "${pkgdir}/usr/lib/perl5/core_perl"
}

