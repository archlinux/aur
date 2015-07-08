# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
pkgname=signing-party
pkgver=2.0
pkgrel=2
pkgdesc="Collection for all kinds of pgp related things, including signing scripts, party preparation scripts etc."
url="http://pgp-tools.alioth.debian.org/"
arch=(i686 x86_64)
license=(GPL)
depends=(perl-class-methodmaker
         perl-gd
	 perl-gnupg-interface
	 perl-mailtools
	 perl-mime-tools
	 perl-net-idn-encode 
	 perl-term-readkey
	 perl-text-template
	 qprint)
makedepends=(subversion)
optdepends=('python: keyart support'
            'qrencode: QR code support in gpg-key2latex'
            'texlive-core: QR code support in gpg-key2latex')
conflicts=(caff mutt sig2dot signing-party-svn)
install=$pkgname.install
source=('http://httpredir.debian.org/debian/pool/main/s/signing-party/signing-party_2.0.orig.tar.gz'
        'gpgwrap_makefile.diff')
sha256sums=('cc23e48b2f06dee7cbf7b80ee4dfbed69908cb4584d3d5fa29ed7b2f962ec16e'
            '696da094676e7cea7562b8c97349d5ef49a6e189bd05736917b54bb505141b9d')

prepare() {
  patch -p1 -d $srcdir -i gpgwrap_makefile.diff
}

build() {
  cd "keyanalyze/pgpring"
  sed -e '/AM_C_PROTOTYPES/d' -i configure.in
  touch NEWS README AUTHORS ChangeLog
  aclocal
  autoconf
  automake --add-missing
  ./configure
  make
  cd $srcdir
  make
}

package() {
  make DESTDIR="$pkgdir" install
  # manually install all files the Makefiles in the subpackages are not installing
  install -D -m644 README $pkgdir/usr/share/doc/signing-party/README
  install -D caff/caff $pkgdir/usr/bin/caff
  install -D caff/pgp-clean $pkgdir/usr/bin/pgp-clean
  install -D caff/pgp-fixkey $pkgdir/usr/bin/pgp-fixkey
  install -D -m644 caff/caff.1 $pkgdir/usr/share/man/man1/caff.1
  install -D -m644 caff/pgp-clean.1 $pkgdir/usr/share/man/man1/pgp-clean.1
  install -D -m644 caff/pgp-fixkey.1 $pkgdir/usr/share/man/man1/pgp-fixkey.1
  install -D -m644 caff/caffrc.sample $pkgdir/usr/share/doc/signing-party/examples/caff/caffrc.sample
  install -D -m644 caff/README $pkgdir/usr/share/doc/signing-party/caff/README
  install -D -m644 caff/README.gpg-agent $pkgdir/usr/share/doc/signing-party/caff/README.gpg-agent
  install -D -m644 caff/README.many-keys $pkgdir/usr/share/doc/signing-party/caff/README.many-keys
  install -D -m644 caff/README.v3-keys $pkgdir/usr/share/doc/signing-party/caff/README.v3-keys
  install -D gpgdir/gpgdir $pkgdir/usr/bin/gpgdir
  install -D -m644 gpgdir/gpgdir.1 $pkgdir/usr/share/man/man1/gpgdir.1
  install -D gpg-key2latex/gpg-key2latex $pkgdir/usr/bin/gpg-key2latex
  install -D -m644 gpg-key2latex/gpg-key2latex.1 $pkgdir/usr/share/man/man1/gpg-key2latex.1
  install -D gpg-key2ps/gpg-key2ps $pkgdir/usr/bin/gpg-key2ps
  install -D -m644 gpg-key2ps/gpg-key2ps.1 $pkgdir/usr/share/man/man1/gpg-key2ps.1
  install -D -m644 gpg-key2ps/README $pkgdir/usr/share/doc/signing-party/gpg-key2ps/README
  install -D gpglist/gpglist $pkgdir/usr/bin/gpglist
  install -D -m644 gpglist/gpglist.1 $pkgdir/usr/share/man/man1/gpglist.1
  install -D gpg-mailkeys/gpg-mailkeys $pkgdir/usr/bin/gpg-mailkeys
  install -D -m644 gpg-mailkeys/gpg-mailkeys.1 $pkgdir/usr/share/man/man1/gpg-mailkeys.1
  install -D gpgparticipants/gpgparticipants $pkgdir/usr/bin/gpgparticipants
  install -D -m644 gpgparticipants/gpgparticipants.1 $pkgdir/usr/share/man/man1/gpgparticipants.1
  install -D gpgparticipants/gpgparticipants-prefill $pkgdir/usr/bin/gpgparticipants-prefill
  install -D -m644 gpgparticipants/gpgparticipants-prefill.1 $pkgdir/usr/share/man/man1/gpgparticipants-prefill.1
  install -D gpgsigs/gpgsigs $pkgdir/usr/bin/gpgsigs
  install -D -m644 gpgsigs/gpgsigs.1 $pkgdir/usr/share/man/man1/gpgsigs.1
  install -D -m644 gpgsigs/gpgsigs-lt2k5.txt $pkgdir/usr/share/doc/signing-party/examples/gpgsigs/gpgsigs-lt2k5.txt
  install -D -m644 gpgsigs/gpgsigs-lt2k5-annotated.txt $pkgdir/usr/share/doc/signing-party/examples/gpgsigs/gpgsigs-lt2k5-annotated.txt
  install -D gpgwrap/bin/gpgwrap $pkgdir/usr/bin/gpgwrap
  install -D -m644 gpgwrap/doc/gpgwrap.1 $pkgdir/usr/share/man/man1/gpgwrap.1
  install -D -m644 keyanalyze/keyanalyze.1 $pkgdir/usr/share/man/man1/keyanalyze.1  
  install -D -m644 keyanalyze/process_keys.1 $pkgdir/usr/share/man/man1/process_keys.1  
  install -D -m644 keyanalyze/pgpring/pgpring.1 $pkgdir/usr/share/man/man1/pgpring.1
  install -D keyanalyze/allkeys.sh $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/allkeys.sh
  install -D keyanalyze/analyze.sh $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/analyze.sh
  install -D -m644 keyanalyze/README $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/README
  install -d $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/scripts
  install keyanalyze/scripts/1000_bottom.php $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/scripts
  install keyanalyze/scripts/1000_top.php $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/scripts
  install keyanalyze/scripts/htmlify_report $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/scripts
  install keyanalyze/scripts/report_bottom.php $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/scripts
  install keyanalyze/scripts/report_top.php $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/scripts
  install -m644 keyanalyze/scripts/top50comments.txt $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/scripts
  install keyanalyze/scripts/top50.pl $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/scripts
  install -d $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/willy
  install keyanalyze/willy/cosign $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/willy
  install keyanalyze/willy/msd2html $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/willy
  install keyanalyze/willy/non-recip $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/willy
  install keyanalyze/willy/party-table.pl $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/willy
  install -m644 keyanalyze/willy/README $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/willy
  install keyanalyze/willy/report $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/willy
  install keyanalyze/willy/sigids $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/willy
  install keyanalyze/willy/unsign $pkgdir/usr/share/doc/signing-party/examples/keyanalyze/willy
  install -D keyart/keyart $pkgdir/usr/bin/keyart
  install -D -m644 keyart/doc/keyart.1 $pkgdir/usr/share/man/man1/keyart.1
  install -D -m644 keyart/README $pkgdir/usr/share/doc/signing-party/keyart/README
  install -D -m644 keyart/doc/druken-bishop.txt $pkgdir/usr/share/doc/signing-party/keyart/druken-bishop.txt
  install -D -m644 keyart/doc/party-worksheet $pkgdir/usr/share/doc/signing-party/keyart/party-worksheet
  install -D keyart/doc/examples/party.sh $pkgdir/usr/share/doc/signing-party/examples/keyart/party.sh
  
}
