# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=dma
pkgver=0.14
pkgrel=2
pkgdesc="DragonFly BSD mail transport agent"
url="https://github.com/corecode/dma"
arch=('x86_64')
license=('BSD-3-Clause')
makedepends=('ed' 'git' 'systemd')
depends=('glibc' 'openssl')
provides=('smtp-forwarder')
conflicts=('smtp-forwarder')
backup=('etc/dma/auth.conf' 'etc/dma/dma.conf')
options=('emptydirs')
source=("git+https://github.com/corecode/dma.git#tag=v${pkgver}")
b2sums=('48e48b7a07725759467078ffb94452d395d55b27a6d6b2be187f6ca4e4df73612ad2b464b65555f4842574f4ff35007a8b94e9024fb2b173dc44bf1e2e86cfef')

build() {
	cd dma
	make PREFIX=/usr LIBEXEC=/usr/lib/dma SBIN=/usr/bin
}

package() {
	cd dma
	make install sendmail-link mailq-link install-etc DESTDIR="$pkgdir" \
	PREFIX=/usr LIBEXEC=/usr/lib/dma SBIN=/usr/bin

	install -d -o root -g mail -m 2775 "$pkgdir/var/spool/dma"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
