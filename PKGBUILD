# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=dma
pkgver=0.14
pkgrel=3
pkgdesc='DragonFly BSD mail transport agent'
url='https://github.com/corecode/dma'
arch=('x86_64')
depends=(
	glibc
	openssl
)
makedepends=(
	bison
	flex
	git
)
provides=('smtp-forwarder')
conflicts=('smtp-forwarder')
license=('BSD-3-Clause')

source=(
	"git+https://github.com/corecode/dma.git#tag=v${pkgver}"
	$pkgname.tmpfiles
)
b2sums=('48e48b7a07725759467078ffb94452d395d55b27a6d6b2be187f6ca4e4df73612ad2b464b65555f4842574f4ff35007a8b94e9024fb2b173dc44bf1e2e86cfef'
        'be6dc5a268d8b6f6f081e9aa9d8286719976f28c4a46ba5bf0dfc5d2b8c294aafc7fe757c714ea9e840508f85c9936495b678ea6eff571f9484b56b44e1050e1')
backup=('etc/dma/auth.conf' 'etc/dma/dma.conf')
options=('emptydirs')

build() {
	cd dma
	make PREFIX=/usr LIBEXEC=/usr/lib/dma SBIN=/usr/bin
}

package() {
	cd dma
	make install install-etc sendmail-link mailq-link \
		DESTDIR="$pkgdir" PREFIX=/usr LIBEXEC=/usr/lib/dma SBIN=/usr/bin

	# dma's Makefile chowns the files, which isn't the Arch way
	chown -R root:root "$pkgdir/etc/dma"
	chown -R root:root "$pkgdir/usr/lib/dma"
	chown -R root:root "$pkgdir/usr/bin/dma"

	install -Dm644 ../$pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
