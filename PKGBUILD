# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=quake-bio # Not to be confused with Quake the game...
pkgver=0.3.1
pkgrel=2
pkgdesc="A package to correct Illumina DNA sequencing reads"
arch=("i686" "x86_64")
url="http://www.cbcb.umd.edu/software/quake"
license=("Artistic2.0")
depends=("jellyfish" "boost-libs" "r" "python2")
makedepends=("boost")
source=("http://www.cbcb.umd.edu/software/quake/downloads/quake-0.3.1.tar.gz"
	"quake-${pkgver}-getopt.patch"
	"quake-${pkgver}-makefile.patch"
	"quake-${pkgver}-nameclash.patch"
	)

build() {
	cd Quake
	patch -p1 < ${srcdir}/quake-${pkgver}-getopt.patch
	patch -p1 < ${srcdir}/quake-${pkgver}-makefile.patch

	# count-qmers and count-kmers conflict with AMOS.  Just prefix all the
	# binaries with `quake'.
	patch -p1 < ${srcdir}/quake-${pkgver}-nameclash.patch
	sed -i -e 's@jellyfish_dir\s\+=\s\+quake_dir@jellyfish_dir = "/usr/bin"@' \
		bin/quake.py
	sed -i -e '1s@#!/usr/bin/env python@&2@' bin/*.py
	cd src
	make
}

package() {
	cd Quake
	install -Dm644 README ${pkgdir}/usr/share/doc/quake/README
	mkdir -p ${pkgdir}/usr/bin
	cp bin/*.{py,r} src/quake-* ${pkgdir}/usr/bin
}

md5sums=('3f72ea0dedc8bc4c0bd0bd5c76235a93'
         'ae1d6f62706b041902ec63320a40f90b'
         'aa6fe2f977c9d9dd613890663c39cb2a'
         'fa6529f2c0a0eb7a7f165a44691df5b2')
md5sums=('3f72ea0dedc8bc4c0bd0bd5c76235a93'
         'ae1d6f62706b041902ec63320a40f90b'
         'aa6fe2f977c9d9dd613890663c39cb2a'
         '57b3720c486ba71bd9dcd8e730134cfd')
md5sums=('3f72ea0dedc8bc4c0bd0bd5c76235a93'
         'ae1d6f62706b041902ec63320a40f90b'
         'aa6fe2f977c9d9dd613890663c39cb2a'
         'c4acdbddf1d4e01c813ced61aec9d135')
