# Author: Dominic Radermacher <dominic.radermacher@gmail.com>
pkgname=ptouch
pkgver=1.3.2
pkgrel=1
pkgdesc="Command line tool to print text or graphic labels on Brother P-touch printers like PT-2430PC"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://mockmoon-cybernetics.ch/computer/p-touch2430pc/"
license=('GPL2')
makedepends=('git' 'autoconf')
depends=('libusb>=1.0' 'gd>=2.0.16')
#source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.xz)
#sha256sums=('327c383c47fb92d34c06b737ca25874326ce2936fb5a94ae38c48f16c14658a3')
source=(git://github.com/dradermacher/ptouch-print.git)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/ptouch-print"
	local ver=$(grep AC_INIT configure.ac | cut -d ',' -f2 |sed -e 's/\[//' -e 's/\]//' -e's/ //')
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/${_gitname}.//" ||
		printf "%sr%s.%s" "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd ${srcdir}/ptouch-print
	touch ./AUTHORS
	autoreconf -i
	./configure --prefix=/usr
	make
}
package() {
	cd ${srcdir}/ptouch-print
	make DESTDIR=${pkgdir} install
}
