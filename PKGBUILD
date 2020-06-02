# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Past maintainer: Joris Steyn <jorissteyn@gmail.com>
# Contributor: TDY <tdy@gmx.com>
pkgname=iozone
pkgver=3.489
_pkgver=${pkgver/./_}
pkgrel=1
pkgdesc="A filesystem benchmark tool"
arch=('i686' 'x86_64')
url="http://www.iozone.org/"
license=('custom')
depends=('sh')
optdepends=('gnuplot: for generating graph reports')
install=$pkgname.install
source=("http://www.${pkgname}.org/src/current/${pkgname}${_pkgver}.tar"
	"${pkgname}${_pkgver}.tar.sig")
sha512sums=('06105bee3eb55d348ca58f51a1ebd5416f0675c8f296b39a1ff44b5d5e396a3f048a3fa72a1d36d4f6cac52f8d0c2a843b7955cf2206cef376666be290d18929'
	    'SKIP')

build() {
	cd "${srcdir}/${pkgname}${_pkgver}/src/current"

	[[ "${CARCH}" == 'x86_64' ]] && TARGET='-AMD64'
	make linux${TARGET} CFLAGS="${CFLAGS}"
}

package() {
	cd "${srcdir}/${pkgname}${_pkgver}/src/current"

	_examples=usr/share/doc/iozone3

	install -Dm755 iozone ${pkgdir}/usr/bin/iozone
	install -Dm755 fileop ${pkgdir}/usr/bin/fileop
	install -Dm755 pit_server ${pkgdir}/usr/bin/pit_server
	install -Dm644 ../../docs/$pkgname.1 ${pkgdir}/usr/share/man/man1/$pkgname.1

	#for i in gnuplotps.dem gnu3d.dem gnuplot.dem Gnuplot.txt client_list; do
	#	install -Dm644 $i ${pkgdir}/$_examples/$i
	#done

	#for i in Generate_Graphs iozone_visualizer.pl gengnuplot.sh report.pl; do
	#	install -Dm755 $i ${pkgdir}/$_examples/$i
	#done
	for i in $(find ${srcdir}/${pkgname}${_pkgver}/docs -type f);
	do
		mode=$(stat -c "%a %n" ${i} | awk '{print $1}')
		fname=$(basename ${i})
		install -Dm${mode} ${i} ${pkgdir}/usr/share/doc/${pkgname}/${fname}
	done

}
