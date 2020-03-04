# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-net-pcap
_realname=Net-Pcap
pkgver=0.18
pkgrel=4
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
sha512sums=('63cc216345eb65b1e76efa657623c9d444d20f4b54ab0c75e787483baaa4f1de7e3a9294967aa7eccbdca04c60b089194dd7e0d19838f899b332c5881a8c7f6d'
            'a5c030a08932df2e76aafcbb48ed4f13ea350961a3876817bacd242c70150ae71c33ee55c6471efd95373ce4c7a95452288a9abe366e563a0fd5cd8be634f867'
            '1cd341657960fea4a7e9c1a0ebfa78e6277c169e39b5b2b3798fe4290a681943bcec970f4bef8d379357f4e4bc3110b0c511f7b95991f4751cccb74592723f66'
            '6a34703ce0549e77ba7c60cd2f60003fa01c18f2bbc68413921ec4b2243469bd4ffbd9f529e529bdf1369116f669cb0a56d79c058a49674c6062479a0a0a8d18')

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
