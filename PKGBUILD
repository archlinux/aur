# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2026.01
pkgrel=1
pkgdesc="A VM with adaptive optimization and JIT compilation, built for Rakudo"
arch=(i686 x86_64 aarch64)
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('zstd')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
b2sums=('e8e900da0d7ba22dec518515accbb1b36e314cd6d30391e489a5230e83640ba82373ba857ff45258976638ef4efa86578bded14089771ec10c7ec51a2320e6ff')

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

