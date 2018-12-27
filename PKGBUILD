# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
# Contributor: Andrew Engelbrecht <sudoman@ninthfloor.org>
pkgname=dict-wn
pkgver=3.1
_debver=3.0
pkgrel=4
pkgdesc="WordNet for dictd et al."
arch=('any')
url="https://wordnet.princeton.edu/"
license=('custom: WordNet License' 'GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'tk' 'python2' 'ghostscript')
provides=('dictd-wn')
conflicts=('dictd-wn')
install="${pkgname}.install"

# The tarball from debian is required for wordnet_structures.py .
source=("http://wordnetcode.princeton.edu/wn${pkgver}.dict.tar.gz"
				"http://ftp.de.debian.org/debian/pool/main/w/wordnet/wordnet_${_debver}.orig.tar.gz")
sha512sums=('16dca17a87026d8a0b7b4758219cd21a869c3ef3da23ce7875924546f2eacac4c2f376cb271b798b2c458fe8c078fb43d681356e3d9beef40f4bd88d3579394f'
            'f153ea6be57ef57b18e4f0857e2ce0493ee75171f60df4b3aa669f4279c1b2ad91641da166b450d95a89166d50d6dc0d9f199710fa2f1ab934882028760d6917')

prepare()
{
	cd WordNet-${_debver}

	# Use the new data.
	cp -rf ../dict/. dict/

	# Apparently, the naming conventions changed.
	# Use the old ones.
	mv -f dict/dbfiles/verb.Framestext dict/frames.vrb

	# Pretend old version.
	mv -f dict/log.grind.{"${pkgver}","${_debver}"}

	# Use python2, pass the url and the name with the new version.
	sed -Ei 's`python (wordnet_structures.py)`python2 \1 --wn_url="https://wordnet.princeton.edu" --db_desc_short="WordNet (r) '"${pkgver}"' (2011)"`' contrib/wordnet_structures/Makefile.in

	# Tcl_Interp structure does by default not contain result.
	sed -Ei '/^#include <tcl.h>$/ i #define USE_INTERP_RESULT' src/stubs.c
}

build() {
	cd WordNet-${_debver}
	./configure

	# Builiding fails with -jN where N>1.
	make -j1
}

package() {
	cd WordNet-${_debver}

	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" \
		contrib/wordnet_structures/wn.{dict.dz,index}

	# Note, that the documentation will be for the old version.
	install -m 0755 -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m 0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" \
		AUTHORS COPYING NEWS README

	install -m 0755 -d "${pkgdir}/usr/share/licenses/dict-wn"
	ln -s /usr/share/doc/dict-wn/COPYING "${pkgdir}/usr/share/licenses/dict-wn"
}
