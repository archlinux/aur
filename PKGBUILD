# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=msieve
_pkgrev=1034
_srcrev=code-r${_pkgrev}-trunk
pkgver=1.54r${_pkgrev}
pkgrel=2
pkgdesc='Library for factoring large integers'
url='https://sourceforge.net/projects/msieve/'
license=('custom')
arch=('x86_64')
depends=('zlib' 'gmp-ecm')
#source=("http://downloads.sourceforge.net/project/msieve/msieve/Msieve%20v1.53/msieve153_src.tar.gz")
#source=("https://sourceforge.net/code-snapshots/svn/m/ms/msieve/code/msieve-${_srcrev}.zip")

# Static copy of the snapshot file since sourceforge regenerates it on demand.
source=("https://arch.vesath.org/sources/msieve-${pkgver}/msieve-${_srcrev}.zip")
sha256sums=('fb51b66376ba6fe31d98ab19958dd4323fff7fa1f5b285dac7688960eb91dd96')

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
