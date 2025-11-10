# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2025.10
pkgrel=1
pkgdesc="A VM with adaptive optimization and JIT compilation, built for Rakudo"
arch=(i686 x86_64 aarch64)
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('zstd')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
b2sums=('710a847162f62243cc0b7081d8678bc4682ede90412d109f3501cedd920b2e69526024893d60bbd3a577653fc435d40b5700e633b7233ff4a62800c42ea2d5cc')

build() {
	if echo $LDFLAGS | grep -sq nodlopen
	then
		cat <<EOT
You can't use nodlopen option to build moarvm. Remove it from LDFLAGS environment variable:
	$LDFLAGS

Most probably it is set in /etc/makepkg.conf
EOT
		exit 1
	fi
	cd $_pkgname-${pkgver}

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-${pkgver}
	make DESTDIR="$pkgdir/" install
}

