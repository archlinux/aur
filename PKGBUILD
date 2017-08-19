# Maintainer: Roman Beslik <me@beroal.in.ua>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Tristelune  <tristelune at archlinux dot info>

_model=e510
_pkgname=cnijfilter
pkgname=cnijfilter-${_model}
pkgver=3.80
pkgrel=3
_pkgreview=2
pkgdesc="Canon IJ Printer Driver (For PIXMA E510 series)"
url="https://www.canon-europe.com/support/consumer_products/products/printers/inkjet/other_pixma/pixma_e514.aspx"
arch=('i686' 'x86_64')
license=('custom')
depends=('libpng<=1.7.0' 'libtiff' 'gtk2' 'popt')
makedepends=('findutils' 'gawk')
_archive_name=${_pkgname}-source-${pkgver}-${_pkgreview}
source=("http://gdlp01.c-wss.com/gds/6/0100005266/01/${_archive_name}.tar.gz"
	'cups.patch'
	'libpng15.patch'
	'configures.patch')
sha512sums=('693dad98b8e69bb4bbad3c62a600b0be5073e8765756cd57722038089387ffe532d01daf5a74d3a8aa93fdc14f7de0326b8aa67acce24d105b0dcb25dfd94be5'
         '447be6afc113074c7401c8ffd603e01d7c127708f0038c5e3bb45c9b63543c477f4ee85806d8b90b886a60312936bfa9bedb19cfef6d688eaedbcd7f1fb9f526'
         '0fb36eca8d6db03e5e55d03a81cf2b6bbcf203529611530429cf727582f83ba1db23165082ba2430ee88075cbcaacb13f9bb384c4fd20b23b91c6dc9d0e9cb09'
         '2a5af45a1978ae37dfb5f6ef7c549be0fed2fc50df8acdb565bf9568fa3c0b2beb4441fef9c49ecf9b22f62acf0dd7cc91e48ab3642d2c26ff10f0cbd8071e13')

if [ "$CARCH" == "x86_64" ]; then  
	_libdir=libs_bin64
else
	_libdir=libs_bin32
fi

prepare() {
	cd "${_pkgname}-source-${pkgver}-${_pkgreview}"
	patch -p1 -i ${srcdir}/cups.patch
	patch -p1 -i ${srcdir}/libpng15.patch
	patch -p1 -i ${srcdir}/configures.patch
}

build() {
	## Compile and install ${_model} stuff
	# ppd file
	cd "${srcdir}/${_archive_name}/ppd"
	./autogen.sh --prefix=/usr --enable-ppdpath=/usr/share/cups/model --program-suffix=${_model}
	make 
	# cnijfilter
	cd "${srcdir}/${_archive_name}/cnijfilter"
	./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --program-suffix=${_model}
	make 
	# lgmon
	cd "${srcdir}/${_archive_name}/lgmon"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --program-suffix=${_model}
	make 
	# cngpijmon
	cd "${srcdir}/${_archive_name}/cngpijmon"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=${_model}
	make 

	# cngpijmnt
	cd "${srcdir}/${_archive_name}/cngpijmnt"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=${_model}
	make 

	## Compile common stuff
	# libs
	cd "${srcdir}/${_archive_name}/libs"
	./autogen.sh --prefix=/usr
	make 
	# cngpij, pstocanonij, backend
	for _c in cngpij pstocanonij backend; do
		cd "${srcdir}/${_archive_name}/${_c}"
		./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
		make 
	done
	# backendnet
	cd "${srcdir}/${_archive_name}/backendnet"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LDFLAGS="-L../../com/${_libdir}"
	make 
	# sm sub process
	cd "${srcdir}/${_archive_name}/cngpijmon/cnijnpr"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LIBS="-ldl"
	make 
	# maintenance
	cd "${srcdir}/${_archive_name}/maintenance"
	./autogen.sh --prefix=/usr --datadir=/usr/share --program-suffix=${_model}
	make 
}

package() {
	# get id of printer model	
	_cmd=$(find ${srcdir}/${_archive_name} -type f -name cif${_model}.conf -path '*[\d]*' -printf '%P' \
		| gawk -F/ '{print $1}')
	_id=${_cmd}
	echo ${pkgdir}


	for dir in ppd cnijfilter lgmon cngpijmon cngpijmnt libs cngpij pstocanonij backend backendnet cngpijmon/cnijnpr maintenance; do
		cd "${srcdir}/${_archive_name}/${dir}"
		make install DESTDIR="${pkgdir}" 
	done

	# Install ${_id} libraries
	install -d ${pkgdir}/usr/lib/
	cp -P ${srcdir}/${_archive_name}/${_id}/${_libdir}/*so* ${pkgdir}/usr/lib/
	install -d ${pkgdir}/usr/lib/bjlib/
	install -m 644 ${srcdir}/${_archive_name}/${_id}/database/* ${pkgdir}/usr/lib/bjlib/
	# Install common libraries
	cp -P ${srcdir}/${_archive_name}/com/${_libdir}/*so* ${pkgdir}/usr/lib/
	install -m 666 ${srcdir}/${_archive_name}/com/ini/* ${pkgdir}/usr/lib/bjlib/

	# Install license file
	cd ${srcdir}/${_archive_name}
	install -d ${pkgdir}/usr/share/licenses/${pkgname}/
	install -m 644 LICENSE-* ${pkgdir}/usr/share/licenses/${pkgname}/
}
