# Maintainer: sourcesmith <sourcesmith 'at' homeport 'dot' org.uk> 
# Original Contributors: Sonic-Y3k <sonic.y3k@googlemail.com>
#                        Giancarlo Bianchi <giancarlobianchi76@gmail.com>
#                        Fortunato Ventre (voRia) <vorione@gmail.com>
#                        Custom Processing Unlimited (CPUnltd) <CPUnltd 'at' gmail 'dot' com>
_model=mg8100
pkgname=cnijfilter-${_model}series
pkgver=3.40
pkgrel=2
_pkgver=3.40-1
pkgdesc="Canon IJ Printer Driver (for ${_model} series)"
url="http://www.canon.co.uk/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mg_series/pixma_mg8150.aspx?type=drivers&os=LINUX"
arch=('x86_64')
license=('custom')
depends=('cups' 'ghostscript' 'popt' 'gtk2')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'findutils' 'gawk')
conflicts=('cnijfilter-common')
install=cnijfilter-mg8100.install
source=('http://files.canon-europe.com/files/soft40245/Software/cnijfilter-source-3.40-1.tar.gz'
        'build-fixes.patch'
        'cups.patch'
        'cups2.patch'
	'id.po.patch'
        'libpng.patch')
sha256sums=('a95dd4ca491a9e8acc3e4ee35cc84904680e82d89ff04a23dda1b0ccffbb8a7a'
            '2fac6cca681320ea248abb73a5d17c7a1f69176b594aeb2cb5c67bd4ace1fd37'
            '65df45b57ab8b0d89578ee50f90ce3831d00ba9da2a09bbaacb58563bfc41e7b'
            '5ace9637d6a894b337cf312d0df06a37e5fa467b7e5b05897fbf1f0c66493e82'
            'df6ff8ef9d8bf825c170b3d5957a93eb7c20b6b4cc39a4944dc74d2852bef1a9'
            'd4b52edbb4cc6a56d93b176341277935357acc0c52ac48abcf0e7e7e9d3c0a7c')

prepare() {
    ## Patches
	msg "Applying patches"
	patch -p0 < build-fixes.patch
	patch -p0 < cups.patch
	patch -p0 < cups2.patch
	patch -p0 < id.po.patch
	patch -p0 < libpng.patch
}

build() {
    CPPFLAGS="${CPPFLAGS} -O2"

    ## Compile ${_model} stuff
	# ppd file
	msg Configuring and making ppd.
	cd "${srcdir}/cnijfilter-source-${_pkgver}/ppd"
	./autogen.sh --prefix=/usr --enable-ppdpath=/usr/share/cups/model --program-suffix=${_model}
	make 
	# cnijfilter
	msg Configuring and making cnijfilter.
	cd "${srcdir}/cnijfilter-source-${_pkgver}/cnijfilter"
	./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --program-suffix=${_model}
	make 
	# lgmon
	msg Configuring and making lgmon.
	cd "${srcdir}/cnijfilter-source-${_pkgver}/lgmon"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --program-suffix=${_model}
	make 
	# cngpijmon
	msg Configuring and making cngpijmon.
	cd "${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=${_model}
	make 

	## Compile common stuff
	# libs
	msg Configuring and making libs.
	cd "${srcdir}/cnijfilter-source-${_pkgver}/libs"
	./autogen.sh --prefix=/usr
	make 
	# cngpij, pstocanonij, backend
	for _c in cngpij pstocanonij backend; do
		echo "Configuring and making ${_c}."
		cd "${srcdir}/cnijfilter-source-${_pkgver}/${_c}"
		./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
		make 
	done
	# backendnet
	msg Configuring and making backendnet.
	cd "${srcdir}/cnijfilter-source-${_pkgver}/backendnet"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LDFLAGS="-L../../com/libs_bin64"
	make 
	# sm sub process
	msg Configuring and making cngpijmon/cnijnpr.
	cd "${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon/cnijnpr"
	./autogen.sh --prefix=/usr LIBS="-ldl"
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
	cp -P ${srcdir}/cnijfilter-source-${_pkgver}/${_id}/libs_bin64/*so* ${pkgdir}/usr/lib/
	install -d ${pkgdir}/usr/lib/bjlib/
	install -m 644 ${srcdir}/cnijfilter-source-${_pkgver}/${_id}/database/* ${pkgdir}/usr/lib/bjlib/
	# Install common libraries
	cp -P ${srcdir}/cnijfilter-source-${_pkgver}/com/libs_bin64/*so* ${pkgdir}/usr/lib/
	install -m 666 ${srcdir}/cnijfilter-source-${_pkgver}/com/ini/* ${pkgdir}/usr/lib/bjlib/

	# Install license file
	cd ${srcdir}/cnijfilter-source-${_pkgver}
	install -d ${pkgdir}/usr/share/licenses/${pkgname}/
	install -m 644 LICENSE-* ${pkgdir}/usr/share/licenses/${pkgname}/
}
