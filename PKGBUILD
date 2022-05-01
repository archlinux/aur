# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

_model=mg6200
pkgname=cnijfilter-${_model}
pkgver=3.60
pkgrel=5
_pkgver=3.60-1
pkgdesc="Canon IJ Printer Driver (for ${_model} series)"
url="http://support-au.canon.com.au/contents/AU/EN/0100392802.html"
arch=('x86_64')
license=('custom')
depends=('libpng>=1.2.8' 'libtiff' 'gtk2' 'popt')
makedepends=('findutils' 'gawk')
source=("http://gdlp01.c-wss.com/gds/8/0100003928/01/cnijfilter-source-${_pkgver}.tar.gz"
	'cups.patch'
	'libpng15.patch'
	'configures.patch'
	'cups2.patch'
	'sysctl.patch'
	)
sha512sums=('69b5c0f3b6bc886d32937e710d244b1cba1644bda025280703ec231d2243c2e0ff6a321b9bc68f8cc43ae596559619aa0f587a7b6d9b0d3b583b22f6faaac2d7'
	'e35e4822095bf06b000b8349a70ab15951caebc95b1e5a098d2833be8660fe9eafdcd4481819b2306b34edd1351ec900c42416f95d74d51a7ae45c75f7ad7dcb'
	'8465275f74e0aa3a2c886dbbc64a2d53bbf62c46496a7de01e7783a9e061df5c5a7b579f39e9dcfc1ff6435603f7caa1a05fdb99cc7242776111182852b04480'
	'f03099b22d41122f318c31ae1ae663a19a784e81453efa2a8b1ea9b726f17f3add840c006db65657588f4a87a517fcef0bff2a79c1305a5ba0ab52f5d0b96f75'
	'de84cc410e2e062f8308b6e438c97da2cf5e9342a909529d82757757df5098f881e71789ff5a5eaec01fe25ab59a0beda31d2d5efd66cfea2f43f198083c1b6f'
	'cd4e829d79f8a76b37a35b03b1e046c8dc84e0570b8159034f2be49d25ce7fe4a920f926f30218d829d2cff7b8123653fa978032bef85cfeb22be983af9a06fd'
	)


prepare() {
	cd "${srcdir}/cnijfilter-source-${_pkgver}"
	patch -p1 < "${startdir}/cups.patch"
	patch -p1 < "${startdir}/cups2.patch"
	patch -p1 < "${startdir}/libpng15.patch"
	patch -p1 < "${startdir}/configures.patch"
	patch -p1 < "${startdir}/sysctl.patch"
	}

build() {
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
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LDFLAGS="-L../../com/libs_bin64"
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

	for dir in ppd cnijfilter printui lgmon cngpijmon libs cngpij pstocanonij backend backendnet cngpijmon/cnijnpr; do
		cd "${srcdir}/cnijfilter-source-${_pkgver}/${dir}"
		make install DESTDIR="${pkgdir}" || return 1
	done

	# Install ${_model} libraries
	install -d ${pkgdir}/usr/lib/
	install -m 755 ${srcdir}/cnijfilter-source-${_pkgver}/${_modelid}/libs_bin64/*so.* ${pkgdir}/usr/lib/
	install -d ${pkgdir}/usr/lib/bjlib/
	install -m 644 ${srcdir}/cnijfilter-source-${_pkgver}/${_modelid}/database/* ${pkgdir}/usr/lib/bjlib/
	# Install common libraries
	install -m 755 ${srcdir}/cnijfilter-source-${_pkgver}/com/libs_bin64/*so.* ${pkgdir}/usr/lib/
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
