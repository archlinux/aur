# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-net-pcap
_realname=Net-Pcap
pkgver=0.20
pkgrel=1.2
pkgdesc="Perl/CPAN Module Net::Pcap"
arch=("i686" "x86_64")
url="https://metacpan.org/release/$_realname"
license=("GPL" "PerlArtistic")
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/C/CO/CORION/$_realname-$pkgver.tar.gz"
	makefile.patch
	listdatalinks.patch
	pcapapi.patch
	pcapapi2.patch
	newapi.patch)
depends=('perl' 'libpcap')
md5sums=('ddec765d484ca1ad56dab1c334e9888a'
         '6fd373462de814761c09663a15449fef'
         '8c982b3e323f67cc718d9bffc7843548'
         '3fa66ae096191affdc766cb138b92fa0'
         'a32fdc3a26cb34732d0e927287922450'
         '1bee68bd698e24935d14dcfafc6439cd')
sha512sums=('1766ee488fb8d530ceb60cedb85a27aae24fb6495a42dab2649a96d81655258c83e5805af7b86757faa6ba04fbf1ab273e0cf642a2d61fdd0759fe965e36ed1d'
            '8797d63f9a28f85d643e0f7358ff2fede6947f094eb4359898e5948baaadf2f577b36f22028d1356916bfe644e04a6f02bb7d1a8cadf4966c375f92fa57c0139'
            '1cd341657960fea4a7e9c1a0ebfa78e6277c169e39b5b2b3798fe4290a681943bcec970f4bef8d379357f4e4bc3110b0c511f7b95991f4751cccb74592723f66'
            'abbfd47fc33597e0f3ca664c67a709f42c772bc9a8e57ab8ee7e2571d4dedf23de79ba61632bb09c6959fdd9d9dfc2d0d4f12acce8a537e69fe29a6c4f6f8334'
            'a5bbfd954d7e4ee93a77eca95ac293c72339a10d3a445ea5617c24290c26d233eebcbde18a23dbbc1134a75b74ec263fbace24db5184482256068e7b694b13b6'
            '9dbe09b11881d5f9b6b93acabaa646249e5c021cdc8bbe960195159f7305c6caa439c6bbf904dda20b5d8e4a132b2ee050eaca488b90e0dd1079e08346e6d525')

prepare() {
  cd $_realname-$pkgver
  patch -Np2 -b -z .orig <../makefile.patch
  patch -Np2 -b -z .orig <../listdatalinks.patch
  patch -Np2 -b -z .orig <../pcapapi.patch
# patch -Np1 -b -z .orig <../pcapapi2.patch
  patch -Np2 -b -z .orig <../newapi.patch
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
