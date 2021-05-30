# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: graziano <giuliani@lamma.rete.toscana.it>

pkgname=perl-netcdf
_pkgname=netcdf-perl
pkgver=1.2.4
pkgrel=5
pkgdesc="A perl extension module for scientific data access via the netCDF API"
arch=('i686' 'x86_64')
url="http://www.unidata.ucar.edu/software/netcdf-perl/"
license=('custom')
conflicts=($_pkgname)
replaces=($_pkgname)
provides=($_pkgname-$pkgver)
depends=('netcdf' 'perl>=0')
options=('!emptydirs')
source=("ftp://ftp.unidata.ucar.edu/pub/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}.patch" "netcdf.patch"
        "ftp://ftp.unidata.ucar.edu/pub/netcdf/old/netcdf-2.4.3.tar.Z")
md5sums=('36b517662bda6a12a76f817acb49a993'
         '290b8c4efe0957e2a17bc6962464c0dc'
         '645d9746d0a2a2a63e3af7e11b727da2'
         'e9371fd9f10dd147374bda38028fd9b1')

build() {
  cd $srcdir/netcdf-2.4.3
  patch -p1 <"$srcdir"/netcdf.patch
  cd $srcdir/$_pkgname-$pkgver/src
  patch -p2 <"$srcdir/${_pkgname}.patch"
  PERL_MANDIR=/usr/share/man/man3 \
  CPP_NETCDF="-I/usr/include" \
  LD_NETCDF="-L/usr/lib -lnetcdf" \
  ./configure --prefix=/usr --mandir=/usr/share/man || return 1
  cd perl
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
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
  cd $srcdir/$_pkgname-$pkgver/src
  install -Dm0644 netCDFPerl.1 "${pkgdir}"/usr/share/man/man3/NetCDF.3pm
  install -Dm0644 $srcdir/netcdf-2.4.3/src/doc/netcdf.3 "$pkgdir"/usr/share/man/man3/netcdf2.3
  install -Dm0644 COPYRIGHT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  cd perl
  make DESTDIR=$pkgdir install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
  _perl_depends
}

# vim:set ts=2 sw=2 et:
