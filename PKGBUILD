# Maintainer: Patryk Kowalczyk < patryk at kowalczyk dot ws>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_author="Daniel P. Berrange"
_perlmod="sys-virt"
_cpanname='Sys-Virt'
pkgname=perl-${_perlmod}
pkgver=5.2.0
pkgrel=1
pkgdesc="Represent and manage a libvirt hypervisor connection"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Sys-Virt/"
license=('GPL' 'PerlArtistic')
depends=('libvirt')
makedepends=('perl-test-pod-coverage' 'perl-xml-xpath' 'perl-module-build')
source=("http://www.cpan.org/authors/id/D/DA/DANBERR/${_cpanname}-v${pkgver}.tar.gz")
md5sums=('a80ae2ba6aa28a403c2a352386ac6c1f')

build() {
  cd ${_cpanname}-v${pkgver}

  # From Fedora spec file - generation of spec file causes make to segfault
  sed -i -e '/Sys-Virt\.spec/d' Makefile.PL
  sed -i -e '/\.spec\.PL$/d' MANIFEST
  rm -f *.spec.PL

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  export MAKEFLAGS='-j1'
  make
}

_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

package() {
  cd ${_cpanname}-v${pkgver}
  make PERL_MM_USE_DEFAULT=1 DESTDIR="${pkgdir}/" install

  # From Fedora RPM spec file - remove empty '.packlist' and '*.bs' files
  find "${pkgdir}" -type f \( -name .packlist -o -name '*.bs' -o -name perllocal.pod -empty \) | xargs rm -vf
  rm -fr "${pkgdir}/usr/lib/perl5/core_perl"
  _perl_depends
}

