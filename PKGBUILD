# Maintainer: gilcu3
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Past maintainer: Joris Steyn <jorissteyn@gmail.com>
# brent s. <bts[at]square-r00t[dot]net>
# Contributor: TDY <tdy@gmx.com>
pkgname=iozone
pkgver=3.506
_pkgver=${pkgver/./_}
pkgrel=4
pkgdesc="A filesystem benchmark tool"
arch=('any')
url="http://www.iozone.org/"
license=('custom')
depends=('sh')
optdepends=('gnuplot: for generating graph reports')
install=$pkgname.install
source=("https://www.${pkgname}.org/src/current/${pkgname}${_pkgver}.tar")
sha512sums=('908919aef957ee587e23ab1d29c0e7cdb985caa1ec80ddee0d3fcdad8aa78978de0f8fc83161b37223237119c50e0626a8366ce6b29debefbfee00240e97105e')

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
