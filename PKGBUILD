# Maintainer: Patryk Kowalczyk < patryk at kowalczyk dot ws>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_author="Daniel P. Berrange"
_perlmod="sys-virt"
pkgname=perl-${_perlmod}
pkgver=1.2.6
pkgrel=1
pkgdesc="Represent and manage a libvirt hypervisor connection"
arch=('any')
url="http://search.cpan.org/dist/Sys-Virt/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=('perl-test-pod-coverage' 'perl-xml-xpath' 'libvirt')
options=(!emptydirs)
source=("http://www.cpan.org/authors/id/D/DA/DANBERR/Sys-Virt-${pkgver}.tar.gz")

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
  find "${pkgdir}" -type f \( -name .packlist -o -name '*.bs' -empty \) | xargs rm -vf
}

md5sums=('c7023228f4e5f870b7c36c4ab1668b27')
