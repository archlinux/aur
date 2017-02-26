# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=trio
pkgver=1.16
pkgrel=1
pkgdesc="Portable string functions, focus on the *printf() and *scanf() clones"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ctrio/"
license=('custom')
provides=('libtrio.so')
source=("http://downloads.sourceforge.net/project/ctrio/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('84d0e74f5b25f0b6c7d9b264ef41f98908e65a5056d4e75c5ef0e05d6a69fc0a')

build() {
	cd "$pkgname"-"$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	
	# add correct installation directories to Makefile
	sed -i '21iDESTDIR         = '                                     Makefile
	sed -i '25s/\${prefix}/\${DESTDIR}\/\${prefix}/'                   Makefile
	sed -i '26s/\${prefix}\/include/\${DESTDIR}\/\${prefix}\/include/' Makefile
	
	make
}

package() {
	cd "$pkgname"-"$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 README "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	# get library major, minor and micro version numbers
	local _major_ver="$(printf libtrio.so.*.*.* | sed 's/libtrio\.so\.//;s/\.[0-9]*\.[0-9]*$//')"
	local _minor_ver="$(printf libtrio.so.*.*.* | sed 's/libtrio\.so\.//;s/^[0-9]*\.//;s/\.[0-9]*$//')"
	local _micro_ver="$(printf libtrio.so.*.*.* | sed 's/libtrio\.so\.//;s/^[0-9]*\.[0-9]*\.//')"
	
	# create missing library symbolic links
	ln -sf "libtrio.so.${_major_ver}.${_minor_ver}.${_micro_ver}" "libtrio.so.${_major_ver}"
	ln -sf "libtrio.so.${_major_ver}.${_minor_ver}.${_micro_ver}" "libtrio.so"
	
	# copy missing library symbolic links to installation directory
	cp -a  "libtrio.so.${_major_ver}" "${pkgdir}/usr/lib"
	cp -a  "libtrio.so"               "${pkgdir}/usr/lib"
}
