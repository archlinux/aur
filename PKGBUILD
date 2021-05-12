# Maintainer: Sébastien Luttringer

pkgname=cnijfilter-mx880
pkgver=3.50_1
pkgrel=2
pkgdesc='Canon IJ Printer Driver for Pixma MX885'
arch=('i686' 'x86_64')
url='https://software.canon-europe.com/software/0040869.asp'
license=('custom')
depends=('libglade' 'cups' 'ghostscript' 'popt')
source=("https://files.canon-europe.com/files/soft40869/software/cnijfilter-source-${pkgver//_/-}.tar.gz"
        'cups.patch'
        'id.po.patch'
        'png.patch')
sha256sums=('e3b00bad3065fcbfc0e9bf340ab830ad9fda91cbde784753a45d239128438aa2'
            '5284075650c40bdef7cd519e6898c0369b99d42b96bc1d80cc1c8d538715f746'
            '26bfc31d455f8729c9f86951add6194037d49a8168d214943f68e46335ae5732'
            'e0537dd99a7f0c74a376ea1e35deaf22033419a7b98d151051ed38f19814ba73')

prepare() {
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}"

	patch -Np1 -i "${srcdir}/cups.patch"
	patch -Np1 -i "${srcdir}/id.po.patch"
	patch -Np1 -i "${srcdir}/png.patch"
}

build() {
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}"
	_model="${pkgname##*-}"

	## Compile and install ${_model} stuff
	# ppd file
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}/ppd"
	./autogen.sh --prefix=/usr --enable-ppdpath=/usr/share/cups/model --program-suffix=${_model}
	make
	# cnijfilter
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}/cnijfilter"
	./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --program-suffix=${_model}
	make
	# printui
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}/printui"
	./autogen.sh --prefix=/usr --datadir=/usr/share --program-suffix=${_model}
	#make || true # Needed to avoid errors while building locales
	make
	# lgmon
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}/lgmon"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --program-suffix=${_model}
	make
	# cngpijmon
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}/cngpijmon"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=${_model}
	make

	## Compile common stuff
	# libs
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}/libs"
	./autogen.sh --prefix=/usr
	make
	# cngpij, pstocanonij, backend
	for _c in cngpij pstocanonij backend; do
		cd "${srcdir}/cnijfilter-source-${pkgver//_/-}/${_c}"
		./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
		make
	done
	# backendnet
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}/backendnet"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LDFLAGS="-L../../com/libs_bin64"
	make
	# sm sub process
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}/cngpijmon/cnijnpr"
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LIBS="-ldl"
	make
}

package() {
	cd "${srcdir}/cnijfilter-source-${pkgver//_/-}"

	_modelid="$(find . -type f -name "cif${pkgname##*-}.conf" -printf '%P' | cut -d'/' -f1)"
	[ -n "${_modelid}" ]

	for dir in ppd cnijfilter printui lgmon cngpijmon libs cngpij pstocanonij backend backendnet cngpijmon/cnijnpr; do
		pushd "${dir}"
		make install DESTDIR="${pkgdir}"
		popd
	done

	# Install ${_model} libraries
	install -d ${pkgdir}/usr/lib/
	install -m 755 ${srcdir}/cnijfilter-source-${pkgver//_/-}/${_modelid}/libs_bin64/*so.* ${pkgdir}/usr/lib/
	install -d ${pkgdir}/usr/lib/bjlib/
	install -m 644 ${srcdir}/cnijfilter-source-${pkgver//_/-}/${_modelid}/database/* ${pkgdir}/usr/lib/bjlib/
	# Install common libraries
	install -m 755 ${srcdir}/cnijfilter-source-${pkgver//_/-}/com/libs_bin64/*so.* ${pkgdir}/usr/lib/
	install -m 666 ${srcdir}/cnijfilter-source-${pkgver//_/-}/com/ini/* ${pkgdir}/usr/lib/bjlib/
	# Make symbolic links for libraries
	cd ${pkgdir}/usr/lib/
	ln -s libcnnet.so.*.*.* libcnnet.so
	for _l in cmcm cnclapi cnclbjcmd cnclui ess; do
		ln -s libcnbp${_l}${_modelid}.so.*.*.* libcnbp${_l}${_modelid}.so
	done
	ln -s libcnbpess${_modelid}.so.*.*.* libcnbpo${_modelid}.so

	# Install license file
	cd ${srcdir}/cnijfilter-source-${pkgver//_/-}
	install -D LICENSE-cnijfilter-${pkgver%_*}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
}
