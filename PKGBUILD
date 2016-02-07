# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2016.01
pkgrel=1
pkgdesc="Perl6 compiler for MoarVM"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
provides=('rakudo-moarvm' 'perl6')
replaces=('rakudo-moarvm')
conflicts=('rakudo-moarvm')
options=('!makeflags')
source=(http://rakudo.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz install.patch)
sha512sums=('b84feb26363c7b75a89fac0ac255f87e5e349265386f7eaf99f761466d8acf8fb5d8eb951c4172278d17af407ff7ccefa73a9543fe9c182a0e78984946481bad'
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
