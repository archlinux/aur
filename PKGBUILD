# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=bleachbit-cli
_pkgname=bleachbit
pkgver=1.6
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. CLI version/no GUI.'
arch=('any')
url='http://bleachbit.sourceforge.net/'
conflicts='bleachbit'
license=('GPL3')
depends=('python2' 'desktop-file-utils')
provides=("bleachbit=${pkgver}")
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.bz2)
sha256sums=('27c6c9b9cdfc5fc6ff6013579951dc64eeff8d8cffbc5a598361005454993b8f')

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
