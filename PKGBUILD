# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2016.07
pkgrel=1
pkgdesc="Perl6 compiler for MoarVM"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
groups=('perl6')
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
provides=('rakudo-moarvm' 'perl6')
replaces=('rakudo-moarvm')
conflicts=('rakudo-moarvm')
options=('!makeflags')
source=("http://rakudo.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz" 'install.patch')
sha512sums=('d0311ed46e6ddaafcd51db5d0e37bb9f29bb06d193f5216545bb03a08424a89d7a62a8675525381b634fbe073cd03704646aca4b7eb89be4f07ab9d3fc097a73'
            'a5243db80d45b354abfdf399a1a393e18c3fde9e42e1ab61b9eeed4aaeb689a4eb7a4c62496f07503bf91dc9eaec6aeca810049e74d15e6dc883e150b9c76cd0')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < "$srcdir"/install.patch
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
