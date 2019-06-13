# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-net-pcap
_realname=Net-Pcap
pkgver=0.18
pkgrel=3
pkgdesc="Perl/CPAN Module Net::Pcap"
arch=("i686" "x86_64")
url="https://metacpan.org/release/$_realname"
license=("GPL" "PerlArtistic")
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/S/SA/SAPER/$_realname-$pkgver.tar.gz"
	makefile.patch
	listdatalinks.patch
	pcapapi.patch)
depends=('perl' 'libpcap')
md5sums=('18d7298dca72b53271d68646c34b6a39'
         '9a8647b3eaacfed4a0d49cd74f20f8b7'
         '8c982b3e323f67cc718d9bffc7843548'
         '61d809cea0de225f859b9f6971ea27ed')

prepare() {
  cd $_realname-$pkgver
  patch -Np2 -b -z .orig <../makefile.patch
  patch -Np2 -b -z .orig <../listdatalinks.patch
  patch -Np1 -b -z .orig <../pcapapi.patch
}

build() {
  cd $_realname-$pkgver
  # install module in vendor directories.
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
  cd $_realname-$pkgver

  make PERL_MM_USE_DEFAULT=1 DESTDIR="$pkgdir/" install

  # remove perllocal.pod and .packlist
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
  _perl_depends
}
