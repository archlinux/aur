pkgname=('dl-c-iso8583')
pkgver='0.0.4'
pkgrel=1
pkgdesc="ISO 8583 is a messaging standard used for payment card originated financial transactions."
license=('custom')
url="http://www.oscarsanderson.com/iso-8583/"
source=('http://www.oscarsanderson.com/wp-content/uploads/2008/07/dl_c_iso8583_v0_0_4_160708_allfiles.tar'
        'LICENSE')
sha256sums=('36a79e43a0abf087a58bff7e86e506a77a4d814b518cb137a00faac6e97c9ab5'
            'aaa6de18a2be49b5bcb3acd99bb61c04c7c11042d136fb512ea96d346df6bbed')

arch=('x86_64')
options=('staticlibs')


_dir=DL_C_ISO8583_v0_0_4_160708_AllFiles
prepare() {
	cd "${srcdir}/$_dir"
	mkdir -p lib src include/${pkgname}
	mv dl_c_common_v0_0_2/*.h include/${pkgname}
	mv dl_c_common_v0_0_2/*.c src
	mv dl_c_iso8583_v0_0_3/*.h include/${pkgname}
	mv dl_c_iso8583_v0_0_3/*.c src
}

build() {
	cd "${srcdir}/$_dir/src"
	for IMP in *.c ; do
		gcc -I../include/${pkgname} $IMP -c -o $IMP.o
	done
	rm -f ../lib/lib${pkgname}.a.${pkgver}
	ar rcs ../lib/lib${pkgname}.a *.o
	gcc -shared -fPIC -I../include/${pkgname} -o ../lib/lib${pkgname}.so.${pkgver} *.c
}

package() {
	mkdir -p "${pkgdir}/usr/include/${pkgname}" "${pkgdir}/usr/lib" "${pkgdir}/usr/share/licenses/${pkgname}"
	cp ${srcdir}/$_dir/include/${pkgname}/* "${pkgdir}/usr/include/${pkgname}/"
	cp ${srcdir}/$_dir/lib/* "${pkgdir}/usr/lib/"
	install "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
	cd "${pkgdir}/usr/lib"
	ln -sf lib${pkgname}.so.${pkgver} lib${pkgname}.so
}
