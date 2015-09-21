# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Tristelune  <tristelune at archlinux dot info>
_model=mg6300
pkgname=cnijfilter-${_model}
pkgver=3.80
pkgrel=9
_pkgver=3.80-1
pkgdesc="Canon IJ Printer Driver (for ${_model} series)"
url="http://fr.canon.ch/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MG_series/PIXMA_MG6350.aspx?DLtcmuri=tcm:109-994583&page=1&type=download"
arch=('i686' 'x86_64')
license=('custom')
depends=('libpng<=1.7.0' 'libtiff' 'gtk2' 'popt')
makedepends=('findutils' 'gawk')
source=("http://gdlp01.c-wss.com/gds/3/0100004693/01/cnijfilter-source-${_pkgver}.tar.gz"
	'cups.patch'
	'libpng15.patch'
	'configures.patch')
md5sums=('b6b92717930021d24bd750d4197bdf3b'
         '5d65e4f2a422fc36d12b50ff25eddc1c'
         'd1984de9df321ee5de075e3ea1208e0e'
         '0c5d0bdee566b67464b8c3133a962666')


if [ "$CARCH" == "x86_64" ]; then  
	_libdir=libs_bin64
else
	_libdir=libs_bin32
fi

build() {

	cd "${srcdir}/cnijfilter-source-${_pkgver}"
	patch -p1 -i ${srcdir}/cups.patch
	patch -p1 -i ${srcdir}/libpng15.patch
	patch -p1 -i ${srcdir}/configures.patch
	echo ${srcdir}

	## Compile and install ${_model} stuff
	# ppd file
	cd "${srcdir}/cnijfilter-source-${_pkgver}/ppd"
	./autogen.sh --prefix=/usr --enable-ppdpath=/usr/share/cups/model --program-suffix=${_model}
	make 
	# cnijfilter
	cd "${srcdir}/cnijfilter-source-${_pkgver}/cnijfilter"
	./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --program-suffix=${_model}
	make 
	# lgmon
	cd "${srcdir}/cnijfilter-source-${_pkgver}/lgmon"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --program-suffix=${_model}
	make 
	# cngpijmon
	cd "${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=${_model}
	make 

	# cngpijmnt
	cd "${srcdir}/cnijfilter-source-${_pkgver}/cngpijmnt"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=${_model}
	make 

	## Compile common stuff
	# libs
	cd "${srcdir}/cnijfilter-source-${_pkgver}/libs"
	./autogen.sh --prefix=/usr
	make 
	# cngpij, pstocanonij, backend
	for _c in cngpij pstocanonij backend; do
		cd "${srcdir}/cnijfilter-source-${_pkgver}/${_c}"
		./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
		make 
	done
	# backendnet
	cd "${srcdir}/cnijfilter-source-${_pkgver}/backendnet"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LDFLAGS="-L../../com/${_libdir}"
	make 
	# sm sub process
	cd "${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon/cnijnpr"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LIBS="-ldl"
	make 
	# maintenance
	cd "${srcdir}/cnijfilter-source-${_pkgver}/maintenance"
	./autogen.sh --prefix=/usr --datadir=/usr/share --program-suffix=${_model}
	make 

}

package() {
	# get id of printer model	
	_cmd=$(find ${srcdir}/cnijfilter-source-${_pkgver} -type f -name cif${_model}.conf -path '*[\d]*' -printf '%P' \
		| gawk -F/ '{print $1}')
	_id=${_cmd}
	echo ${pkgdir}
	

	for dir in ppd cnijfilter lgmon cngpijmon cngpijmnt libs cngpij pstocanonij backend backendnet cngpijmon/cnijnpr maintenance; do
		cd "${srcdir}/cnijfilter-source-${_pkgver}/${dir}"
		make install DESTDIR="${pkgdir}" 
	done

	# Install ${_id} libraries
	install -d ${pkgdir}/usr/lib/
	cp -P ${srcdir}/cnijfilter-source-${_pkgver}/${_id}/${_libdir}/*so* ${pkgdir}/usr/lib/
	install -d ${pkgdir}/usr/lib/bjlib/
	install -m 644 ${srcdir}/cnijfilter-source-${_pkgver}/${_id}/database/* ${pkgdir}/usr/lib/bjlib/
	# Install common libraries
	cp -P ${srcdir}/cnijfilter-source-${_pkgver}/com/${_libdir}/*so* ${pkgdir}/usr/lib/
	install -m 666 ${srcdir}/cnijfilter-source-${_pkgver}/com/ini/* ${pkgdir}/usr/lib/bjlib/

	# Install license file
	cd ${srcdir}/cnijfilter-source-${_pkgver}
	install -d ${pkgdir}/usr/share/licenses/${pkgname}/
	install -m 644 LICENSE-* ${pkgdir}/usr/share/licenses/${pkgname}/
}

