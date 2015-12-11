# Maintainer: Einhard Leichtfuß <respiranto@icloud.com>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
# Contributor: Andrew Engelbrecht <sudoman@ninthfloor.org>
pkgname=dict-wn
pkgver=3.0
pkgrel=5
pkgdesc="WordNet for dictd et al."
arch=('any')
url="http://wordnet.princeton.edu/"
license=('custom: WordNet License' 'GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'tk' 'python2' 'ghostscript')
provides=('dictd-wn')
conflicts=('dictd-wn')
install=$pkgname.install
# the tarball from debian is required, since it contains wordnet_structures.py
source=("http://ftp.de.debian.org/debian/pool/main/w/wordnet/wordnet_$pkgver.orig.tar.gz")
md5sums=('a91cee4bab52c750dc25e3b1d296a091');

build() {
	cd WordNet-$pkgver
	./configure

	# we need to use python2, pass the name, and the url of the new WN version
	sed -i 's/python wordnet_structures.py/python2 wordnet_structures.py --wn_url="http:\/\/wordnet\.princeton.edu" --db_desc_short="     WordNet \(r\) 3\.0 \(2006\)"/g' contrib/wordnet_structures/Makefile

	# Tcl_Interp structure does by default not contain result
	sed -i 's/^#include <tcl.h>$/#define USE_INTERP_RESULT\n#include <tcl.h>/' src/stubs.c

	make
}

package() {
	cd WordNet-$pkgver
	mkdir -p "$pkgdir/usr/share/dictd/"
	cp contrib/wordnet_structures/wn.{dict.dz,index} "$pkgdir/usr/share/dictd/"
	
	install -m 0755 -d "$pkgdir/usr/share/doc/$pkgname"
	install -m 0644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS COPYING NEWS README
	
	mkdir -p "$pkgdir/usr/share/licenses/dict-wn"
	ln -s /usr/share/doc/dict-wn/COPYING "$pkgdir/usr/share/licenses/dict-wn"
}
