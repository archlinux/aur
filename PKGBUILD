# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com> 
# Original Contributors: Giancarlo Bianchi <giancarlobianchi76@gmail.com>
#                        Fortunato Ventre (voRia) <vorione@gmail.com>
#                        Custom Processing Unlimited (CPUnltd) <CPUnltd 'at' gmail 'dot' com>
_model=mg5300
pkgname=cnijfilter-${_model}
pkgver=3.60
pkgrel=8
_pkgver=3.60-1
pkgdesc="Canon IJ Printer Driver (for ${_model} series)"
url="http://support-au.canon.com.au/contents/AU/EN/0100392802.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('gtk2' 'popt')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'findutils' 'gawk')
conflicts=('cnijfilter-common')
install=cnijfilter-mg5300.install
source=("http://gdlp01.c-wss.com/gds/8/0100003928/01/cnijfilter-source-${_pkgver}.tar.gz"
				'build-fixes.patch'
				'cups.patch'
				'id.po.patch'
				'libpng.patch')
sha256sums=('7e4f91a0aebfa32d75da046a20bab992bd6032bb2069cf0091e77d8119a489de'
	       'ffd5c8cf926d6956cd8eec7e36c27fd080ea4f6dfd9e324f4890902584080617'
	       '0b0cad3fad763a35d06550eda1c9de9b7592d4b29b2acb4a927efcad77fbb76c'
	       'b535f0cf501ec4023a3166f85d230d9c0da24e3cdaa5ba3ba435669cb14cbd4c'
	       'f1723e8e6a84942bd9fcfefef3efb20a40384ffb449101eccecf02aac929399c')

if [ "$CARCH" == "x86_64" ]; then  
	_libdir=libs_bin64
else
	_libdir=libs_bin32
fi

prepare() {
    ## Patches
	msg "Applying patches"
    patch -p0 < build-fixes.patch
	patch -p0 < cups.patch
	patch -p0 < id.po.patch
	patch -p0 < libpng.patch
}

build() {
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
}

package() {
	# get id of printer model	
	_cmd=$(find ${srcdir}/cnijfilter-source-${_pkgver} -type f -name cif${_model}.conf -path '*[\d]*' -printf '%P' \
		| gawk -F/ '{print $1}')
	_id=${_cmd}
	echo ${pkgdir}
	

	for dir in ppd cnijfilter lgmon cngpijmon libs cngpij pstocanonij backend backendnet cngpijmon/cnijnpr; do
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
