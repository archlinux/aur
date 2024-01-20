# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=icon
pkgver=9.5.24a
pkgrel=1
epoch=1
pkgdesc="The Icon programming language"
url="https://github.com/gtownsend/icon"
arch=('i686' 'x86_64')
depends=('sh' 'libx11')
makedepends=('libxt')
license=('custom:publicdomain')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz" LICENSE)
sha256sums=('73eaf9b1bd0d0bb21c252110e7e9e5d146ef37bef2cd72c46e023d71305fa801'
            '57b2b71129aa652ca63b07d3c23564bc7a45444a274d12e50856b46e4d088e35')

build() {
	cd $pkgname-${pkgver}
	make X-Configure name=linux
	make CFLAGS+=" -D_STDIO_USES_IOSTREAM" -j1
}

package() {
	cd $pkgname-${pkgver}
	install -d "$pkgdir"/usr/share
	make Install dest="$pkgdir"/usr/share/icon
	for _i in colrbook colrpick fontpick icont iconx palette vib wevents
	do
		install -D -m755 "$pkgdir"/usr/share/icon/bin/$_i "$pkgdir"/usr/bin/$_i
		rm "$pkgdir"/usr/share/icon/bin/$_i
	done
	cd "$pkgdir"/usr/share/icon/bin
	rm icon
	install -D -m644 "$pkgdir"/usr/share/icon/bin/libcfunc.so "$pkgdir"/usr/lib/libcfunc.so
	rm "$pkgdir"/usr/share/icon/bin/libcfunc.so
	rm -fr "$pkgdir"/usr/share/icon/bin
	for _i in icont icon
	do
		install -D -m644 "$pkgdir"/usr/share/icon/man/man1/$_i.1 "$pkgdir"/usr/share/man/man1/$_i.1
		rm "$pkgdir"/usr/share/icon/man/man1/$_i.1
	done
	rmdir "$pkgdir"/usr/share/icon/man/man1/
	rmdir "$pkgdir"/usr/share/icon/man
	cd "$pkgdir"/usr/bin
	ln -s icont icon
	install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/icon/LICENSE
}
