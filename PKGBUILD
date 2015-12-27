# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2015.12
pkgrel=1
pkgdesc="Perl6 compiler for MoarVM"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
provides=('rakudo-moarvm')
replaces=('rakudo-moarvm')
conflicts=('rakudo-moarvm')
options=('!makeflags')
source=(http://rakudo.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz install.patch)
sha512sums=('48e4c98bbff67a52f68a835cc87a19a0b17f2d67790f8162ffd9f167f080d09180d375b5ea9a8577d1de5036c78e604473a2140107d448aff3630c138fd16114'
            'f011a6805c9251a6ac70cd5497b62b2663f3e35f660c4daa1871ce9adcf3c6ba870979ecfc62c4fea49857cc7eddaa1c515f470d0f8c43d0fc26daa76ab02556')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < ../install.patch
}

build() {
	cd "$pkgname-$pkgver"
	perl Configure.pl --prefix=/usr --backends=moar
	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	find "$pkgdir"/usr/share/perl6/precomp -type f -exec env _pkgdir="$pkgdir" perl -pe 's/\Q$ENV{_pkgdir}//g' -i '{}' '+'
}
