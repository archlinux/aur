# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=msieve
_pkgrev=1034
_srcrev=code-r${_pkgrev}-trunk
pkgver=1.54r${_pkgrev}
pkgrel=1
pkgdesc='Library for factoring large integers'
url='https://sourceforge.net/projects/msieve/'
license=('custom')
arch=('x86_64')
depends=('zlib' 'gmp-ecm')
source=("https://sourceforge.net/code-snapshots/svn/m/ms/msieve/code/msieve-${_srcrev}.zip")
sha256sums=('c2d99529f410f30259a223b9e0e6a26a0929aace5e4bf671bf973e4b2d18e091')

prepare() {
	cd "${srcdir}/${pkgname}-${_srcrev}"
	sed \
		-e 's/^CFLAGS =/CFLAGS +=/' \
		-e "/^SVN_VERSION :=/s/=.*/= r${_pkgrev}/" \
		-i Makefile
}

build() {
	cd "${srcdir}/${pkgname}-${_srcrev}"
	CFLAGS+=' -fopenmp'
	make all ECM=1
}

package() {
	cd "${srcdir}/${pkgname}-${_srcrev}"
	install -Dm755 msieve "${pkgdir}"/usr/bin/msieve
	install -Dm644 Readme "${pkgdir}"/usr/share/doc/msieve/Readme
	install -d "${pkgdir}"/usr/share/licenses/msieve
	ln -s /usr/share/doc/msieve/Readme "${pkgdir}"/usr/share/licenses/msieve/LICENSE
}
