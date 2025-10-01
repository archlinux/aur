# Maintainer: gilcu3
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Past maintainer: Joris Steyn <jorissteyn@gmail.com>
# brent s. <bts[at]square-r00t[dot]net>
# Contributor: TDY <tdy@gmx.com>
pkgname=iozone
pkgver=3.508
_pkgver=${pkgver/./_}
pkgrel=1
pkgdesc="A filesystem benchmark tool"
arch=('any')
url="http://www.iozone.org/"
license=('custom')
depends=('sh')
optdepends=('gnuplot: for generating graph reports')
install=$pkgname.install
source=("https://www.${pkgname}.org/src/current/${pkgname}${_pkgver}.tar")
sha512sums=('98ff2dafa154c25aad94c6e34bfc438392a01aec98cf76b742b2b3b6b828d358793c1aa093ebfb93ef484052b3c562987f66c841c7aeb22c9b856bf234836618')

build() {
	cd "${srcdir}/${pkgname}${_pkgver}/src/current"

	[[ "${CARCH}" == 'x86_64' ]] && TARGET='-AMD64'
	make -j1 linux${TARGET} CFLAGS="${CFLAGS}"
}

package() {
	cd "${srcdir}/${pkgname}${_pkgver}/src/current"

	_examples=/usr/share/doc/iozone3/examples

	install -Dm755 iozone ${pkgdir}/usr/bin/iozone
	install -Dm755 fileop ${pkgdir}/usr/bin/fileop
	install -Dm755 pit_server ${pkgdir}/usr/bin/pit_server
	install -Dm644 ../../docs/$pkgname.1 ${pkgdir}/usr/share/man/man1/$pkgname.1

	for i in $(find ${srcdir}/${pkgname}${_pkgver}/docs -type f);
	do
		mode=$(stat -c "%a %n" ${i} | awk '{print $1}')
		fname=$(basename ${i})
		install -Dm${mode} ${i} ${pkgdir}/usr/share/doc/${pkgname}/${fname}
	done

}
