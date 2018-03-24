# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=bleachbit-cli
_pkgname=bleachbit
pkgver=2.0
pkgrel=2
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. CLI version/no GUI.'
arch=('any')
url='http://bleachbit.sourceforge.net/'
conflicts=('bleachbit')
license=('GPL3')
depends=('python2')
provides=("bleachbit=${pkgver}")
source=(https://download.bleachbit.org/$_pkgname-$pkgver.tar.bz2)
sha256sums=('e9b7bec39574af68e64bf1a0fa70cbebc421a18978fa83974878044bfa47495f')

#prepare() {
#	cd "$_pkgname-$pkgver"
#	patch -Np1 -i "$srcdir"/foo.patch
#}

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
