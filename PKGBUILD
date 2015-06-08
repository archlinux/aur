# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname='perl-net-smtp-tls'
_cpanname='Net-SMTP-TLS'
pkgver='0.12'
pkgrel='1'
pkgdesc='Perl SMTP client supporting TLS and AUTH'
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-digest-hmac' 'perl-io-socket-ssl' 'perl-net-ssleay')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/A/AW/AWESTHOLM/Net-SMTP-TLS-0.12.tar.gz"
        "tls-fixes.diff")
md5sums=('a845eba3670e56a197ecd37f571d153a'
         '6bd41774da31f07c7b60a28db6247922')

# Function to change to the working directory and set
# environment variables to override undesired options.
prepareEnvironment() {
	cd "$srcdir/$_cpanname-$pkgver"
	export \
		PERL_MM_USE_DEFAULT=1 \
		PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		MODULEBUILDRC=/dev/null
}

build() {
	prepareEnvironment
	/usr/bin/perl Makefile.PL
	make

    cd lib/Net/SMTP
    patch < "$srcdir/tls-fixes.diff"
}

check() {
	prepareEnvironment
	make test
}

package() {
	prepareEnvironment
	make install

	# Remove "perllocal.pod" and ".packlist".
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

