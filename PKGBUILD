# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=bleachbit-cli
_pkgname=bleachbit
pkgver=1.8
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. CLI version/no GUI.'
arch=('any')
url='http://bleachbit.sourceforge.net/'
conflicts='bleachbit'
license=('GPL3')
depends=('python2' 'desktop-file-utils')
provides=("bleachbit=${pkgver}")
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.bz2)
sha256sums=('dbf50fcbf24b8b3dd1c4325cd62352628d089f88a76eab804df5d90c872ee592')

build() {
	cd "$_pkgname-$pkgver"

	for file in $(find . -name '*.py' -print); do
		sed -i -e 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' \
			-i -e 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "$file"
	done
	sed -i 's/python/python2/g' Makefile
}

package() {
	cd "$_pkgname-$pkgver"

	make prefix=/usr DESTDIR="$pkgdir" PYTHON=python2 install
	
	#	suggestion by Meow to force script to operate in cli mode
	sed -i 's/if 1/if 0/' "$pkgdir"/usr/bin/bleachbit
	rm -rf "$pkgdir"/usr/share/{applications,pixmaps}
}
