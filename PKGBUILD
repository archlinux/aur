# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2026.03
pkgrel=1
pkgdesc="A VM with adaptive optimization and JIT compilation, built for Rakudo"
arch=(i686 x86_64 aarch64)
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('zstd')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
b2sums=('11f64ab422a8e04a00a1637a29ab2204393b116d5b574e270873a57520f7ea0c926bbf8a912e2c98fc744e523dd2265b4367f199d9606390b214087a4fb52c31')

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

