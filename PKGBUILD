# Contributor : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgbase=intel-oneapi-mkl
pkgname=(intel-oneapi-mkl intel-oneapi-mkl-static)
_pkgver=2022.0.2
_debpkgrel=136
pkgver=${_pkgver}_${_debpkgrel}
pkgrel=1
pkgdesc="Intel® oneAPI Math Kernel Library"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=(
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb"
	"${pkgname}.conf"
	"${pkgname}.sh"
)
noextract=(
	"${pkgname}-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-common-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb"
	"${pkgname}-common-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb"
)
sha256sums=('0d01beddf0d6b8f2fd017322a1ef150bc3d483f9f0a3fe774f08977037327bcf'
            '9041a804d7b41813c1816d15bba749fbca59cb56603d66b8b9fe99fc133b48fe'
            '136bf4a2208350a7e45a0d6fc741af7999b8c4bc192b070bdb1bad858cb4b0b7'
            '5ab00cbc8c7d9cf1f83b1947ee40c6eab0f574cc7f6d0923ea88d4a41020aea0'
            'f2932e9ab3d2c75bc354f55322e2a2821877b84f0e3d5dbbefa233144d14ba09'
            'e8f67c2e5fbc91e9de48c5ff745c8077a23427676d834f60c0126e95ac1547fb')

build() {
	ar x ${pkgname}-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	rm -r opt/intel/oneapi/conda_channel
}

package_intel-oneapi-mkl() {
	depends=('intel-oneapi-common-vars>=2022.0.0' 'intel-oneapi-common-licensing=2022.0.0'
    'intel-oneapi-tbb>=2021.5.1' 'intel-oneapi-compiler>=2022.0.2' 
	'intel-oneapi-tbb<2021.5.2' 'intel-oneapi-compiler<2022.0.3' )
	provides=('intel-mkl')
	conflicts=('intel-mkl')
	cp -r ${srcdir}/opt ${pkgdir}
	ln -sfT "$_pkgver" ${pkgdir}/opt/intel/oneapi/mkl/latest

	install -Dm644 ${pkgname}.conf ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf
	install -Dm644 ${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh

	# pkgconfig
	cd ${pkgdir}/opt/intel/oneapi/mkl/latest/lib/pkgconfig
	install -d ${pkgdir}/usr/share/pkgconfig
	for _file in $(find . -mindepth 1 -name '*dynamic*' -printf "%f\n"); do
		ln -sf /opt/intel/oneapi/mkl/latest/lib/pkgconfig/${_file} ${pkgdir}/usr/share/pkgconfig/${_file}
	done

	# provide community/intel-mkl
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/opt/intel/mkl
	install -d ${pkgdir}/opt/intel/mkl/lib
	ln -sf /opt/intel/oneapi/mkl/latest/bin/intel64 ${pkgdir}/opt/intel/mkl/bin
	ln -sf /opt/intel/oneapi/mkl/latest/lib/intel64 ${pkgdir}/opt/intel/mkl/lib/intel64
	ln -sf /opt/intel/oneapi/mkl/latest/lib/intel64 ${pkgdir}/opt/intel/mkl/lib/intel64_lin
	ln -sf /opt/intel/oneapi/mkl/latest/include ${pkgdir}/opt/intel/mkl/include	
	ln -sf ${pkgdir}/opt/intel/mkl/bin/mkl_link_tool ${pkgdir}/usr/bin/mkl_link_tool
}

package_intel-oneapi-mkl-static() {
	pkgdesc="$pkgdesc (static libs)"
	depends=("$pkgbase=$pkgver")
	provides=('intel-mkl-static')
	conflicts=('intel-mkl-static')
	options=(staticlibs)
	cd ${srcdir}
	for _file in $(find . -name '*.a'); do
		_filename=$(echo $_file | sed "s/.a$//g")
		if [ -f "$_filename.so" ]; then
			cp --parents ${_file} ${pkgdir}/
		fi
	done

	# pkgconfig
	cd ${srcdir}/opt/intel/oneapi/mkl/$_pkgver/lib/pkgconfig
	install -d ${pkgdir}/usr/share/pkgconfig
	for _file in $(find . -mindepth 1 -name '*static*' -printf "%f\n"); do
		ln -sf /opt/intel/oneapi/mkl/latest/lib/pkgconfig/${_file} ${pkgdir}/usr/share/pkgconfig/${_file}
	done
}
