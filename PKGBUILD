# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>
_model=mg6200
pkgname=cnijfilter-${_model}
pkgver=3.60
pkgrel=4
_pkgver=3.60-1
pkgdesc="Canon IJ Printer Driver (for ${_model} series)"
url="http://support-au.canon.com.au/contents/AU/EN/0100392802.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('libpng>=1.2.8' 'libtiff' 'gtk2' 'popt')
makedepends=('findutils' 'gawk')
source=("http://gdlp01.c-wss.com/gds/8/0100003928/01/cnijfilter-source-${_pkgver}.tar.gz"
	'cups.patch'
	'libpng15.patch'
	'configures.patch')
md5sums=('70e412331a21f4b573b4e901c89cee18'
	'438586f7386033bff8de318e56779545'
	'448241d96048dfc76f7bb7b53f9d7621'
	'5100f205bfbd86741679f697ebe64a4b')


_getlibdir() {
	if [ "$CARCH" == "x86_64" ]; then
		echo libs_bin64
	else
		echo libs_bin32
	fi
	}

prepare() {
	cd "${srcdir}/cnijfilter-source-${_pkgver}"
	patch -p1 < "${startdir}/cups.patch"
	patch -p1 < "${startdir}/libpng15.patch"
	patch -p1 < "${startdir}/configures.patch"
	}

build() {
	_libdir=$(_getlibdir)

	## Compile and install ${_model} stuff
	# ppd file
	cd "${srcdir}/cnijfilter-source-${_pkgver}/ppd"
	./autogen.sh --prefix=/usr --enable-ppdpath=/usr/share/cups/model --program-suffix=${_model}
	make clean || return 1
	make || return 1
	# cnijfilter
	cd "${srcdir}/cnijfilter-source-${_pkgver}/cnijfilter"
	./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --program-suffix=${_model}
	make clean || return 1
	make || return 1
	# printui
	cd "${srcdir}/cnijfilter-source-${_pkgver}/printui"
	./autogen.sh --prefix=/usr --datadir=/usr/share --program-suffix=${_model}
	make || true # Needed to avoid errors while building locales
	make clean || return 1
	make || return 1
	# lgmon
	cd "${srcdir}/cnijfilter-source-${_pkgver}/lgmon"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --program-suffix=${_model}
	make clean || return 1
	make || return 1
	# cngpijmon
	cd "${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=${_model}
	make clean || return 1
	make || return 1

	## Compile common stuff
	# libs
	cd "${srcdir}/cnijfilter-source-${_pkgver}/libs"
	./autogen.sh --prefix=/usr
	make clean || return 1
	make || return 1
	# cngpij, pstocanonij, backend
	for _c in cngpij pstocanonij backend; do
		cd "${srcdir}/cnijfilter-source-${_pkgver}/${_c}"
		./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
		make clean || return 1
		make || return 1
	done
	# backendnet
	cd "${srcdir}/cnijfilter-source-${_pkgver}/backendnet"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LDFLAGS="-L../../com/${_libdir}"
	make clean || return 1
	make || return 1
	# sm sub process
	cd "${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon/cnijnpr"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LIBS="-ldl"
	make clean || return 1
	make || return 1
	}

package() {
	_modelid=`find ${srcdir}/cnijfilter-source-${_pkgver} -type f -name cif${_model}.conf -path '*[\d]*' -printf '%P' \
		| gawk -F/ '{print $1}'`
	[ -n "${_modelid}" ] || return 1
	_libdir=$(_getlibdir)

	for dir in ppd cnijfilter printui lgmon cngpijmon libs cngpij pstocanonij backend backendnet cngpijmon/cnijnpr; do
		cd "${srcdir}/cnijfilter-source-${_pkgver}/${dir}"
		make install DESTDIR="${pkgdir}" || return 1
	done

	# Install ${_model} libraries
	install -d ${pkgdir}/usr/lib/
	install -m 755 ${srcdir}/cnijfilter-source-${_pkgver}/${_modelid}/${_libdir}/*so.* ${pkgdir}/usr/lib/
	install -d ${pkgdir}/usr/lib/bjlib/
	install -m 644 ${srcdir}/cnijfilter-source-${_pkgver}/${_modelid}/database/* ${pkgdir}/usr/lib/bjlib/
	# Install common libraries
	install -m 755 ${srcdir}/cnijfilter-source-${_pkgver}/com/${_libdir}/*so.* ${pkgdir}/usr/lib/
	install -m 666 ${srcdir}/cnijfilter-source-${_pkgver}/com/ini/* ${pkgdir}/usr/lib/bjlib/
	# Make symbolic links for libraries
	cd ${pkgdir}/usr/lib/
	ln -s libcnnet.so.*.*.* libcnnet.so
	for _l in cmcm cnclapi cnclbjcmd cnclui ess; do
		ln -s libcnbp${_l}${_modelid}.so.*.*.* libcnbp${_l}${_modelid}.so
	done
	ln -s libcnbpess${_modelid}.so.*.*.* libcnbpo${_modelid}.so

	# Install license file
	cd ${srcdir}/cnijfilter-source-${_pkgver}
	install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
	}
