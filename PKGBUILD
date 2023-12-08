# Maintainer: freggel.doe <freggel.doe@gmx.net>

pkgname=perl-authen-webauthn
_cpanname=Authen-WebAuthn
_module=Authen::WebAuthn
_commit=df5ea2aafd7cc252f432281350565a17d97676f4
_cpanver=0.001
pkgver=0.002  # doesn't work yet: tests are failing
pkgver=0.001
pkgrel=1
pkgdesc="A library to add Web Authentication support to server applications"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-cbor-xs' 'perl-cryptx' 'perl-crypt-openssl-x509' 'perl-json-xs' 'perl-mouse' 'perl-uri')
makedepends=()
checkdepends=('perl-hash-merge-simple')
options=('!emptydirs')
source=(
    "https://cpan.metacpan.org/authors/id/M/MB/MBESSON/$_cpanname-$_cpanver.tar.gz"
    "https://github.com/LemonLDAPNG/$_cpanname/archive/$_commit.tar.gz"
)
sha256sums=('8107e98171a216670501bfb6adce75d09508e3411767b0acdf03787c86e70fd8'
            '7bf8182514c730d842abd53e9cb37d1706e6711697dd5e30c840952658a9f8b6')

build() {
    if [[ $pkgver > $_cpanver ]]; then
        rm -fr "$srcdir/$_cpanname-$_cpanver/lib"
        cp -a "$srcdir/$_cpanname-$_commit/lib" "$srcdir/$_cpanname-$_cpanver/lib"
        mv "$srcdir/$_cpanname-$_cpanver" "$srcdir/$_cpanname-$pkgver"
    fi

    cp -a "$srcdir/$_cpanname-$_commit/lib" "$srcdir/$_cpanname-$pkgver/lib"
    cd "$srcdir/$_cpanname-$pkgver"
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
}

check() {
    cd "$srcdir/$_cpanname-$pkgver"
    make test
}

package() {
    cd "$srcdir/$_cpanname-$pkgver"
    make install DESTDIR="$pkgdir"
}

# vim:set ts=4 sw=4 expandtab:
