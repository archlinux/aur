# Maintainer:  Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=jpilot
pkgver=2.1.1
pkgrel=1
pkgGitHubCommit=ca409e125e1683bf842f206b13040d8c29605a69
pkgdesc="A desktop organizer application for the Palm Pilot"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/juddmon/jpilot/"
license=('GPL2')
depends=('openssl' 'gtk3' 'pilot-link-git' 'slang')
makedepends=('intltool')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/juddmon/jpilot/archive/${pkgGitHubCommit}.tar.gz")
sha256sums=('f2556cf7fbe3df2d8a6ec66aa83c25db965d28bcf3aa3763a5db8e4ec399c774')

prepare() {
	rm -rf "${srcdir}"/$pkgname-$pkgver-$pkgrel
	mv $srcdir/$pkgname-$pkgGitHubCommit "${srcdir}"/$pkgname-$pkgver-$pkgrel
}

build() {
	cd "${srcdir}"/$pkgname-$pkgver-$pkgrel

	./autogen.sh --prefix=/usr --disable-pl-test --disable-gtktest
	# sed command provided by Cylgalad for the old pilot-link 0.12.5-2
	#sed -e 's/return Contact_add_blob(c, blob);/return Contact_add_blob(c, (void*)blob);/' \
	#    -e 's/^#include "jp-pi-contact.h"/\/\/ #include "jp-pi-contact.h"/' jp-contact.c > /tmp/jp-contact.c
	#mv /tmp/jp-contact.c .
	make
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver-$pkgrel

	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}"/usr/share/pixmaps
	cd "${pkgdir}"/usr/share/pixmaps
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot-icon1.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon2.xpm jpilot-icon2.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon3.xpm jpilot-icon3.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon4.xpm jpilot-icon4.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot.xpm
}

