# Maintainer: Alexey Manukhin <axxapy@gmail.com>

pkgname=php-runkit
pkgdesc='Runkit is set of tools which allowes to do what Reflection does not allow. Usefull for unit tests.'
pkgver=git
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url=https://github.com/zenovich/runkit

makedepends=('php')
source=("git+https://github.com/zenovich/runkit.git" "https://github.com/zenovich/runkit/pull/73.diff")
md5sums=('SKIP' '768c220680f414b1b3858f0d856e6a40')
depends=('php')

build() {
	cd ${srcdir}/runkit || return 1
	patch -p1 < $startdir/73.diff
	phpize || return 1
	./configure ${peclconfig}|| return 1
	make || return 1
}

package_php-runkit() {
	install -d -m755 ${pkgdir}/usr/lib/php/modules/
	install -m644 ${srcdir}/runkit/modules/runkit.so ${pkgdir}/usr/lib/php/modules//runkit.so
	
	echo 'extension=runkit.so' > ${startdir}/runkit.ini || return 1
	echo 'runkit.internal_override=1' >> ${startdir}/runkit.ini || return 1
	install -D -m 644 $startdir/runkit.ini ${pkgdir}/etc/php/conf.d/runkit.ini || return 1
}

