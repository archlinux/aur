# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor:Caleb Maclennan <caleb@alerque.com>
pkgname='sile'
pkgdesc='Modern typesetting system inspired by TeX'
pkgver='0.9.3'
_libtexpdf_ver='04ad589e2aaaa6db1147de1f43cf5bc7e7ed327a'
pkgrel='1'
arch=('i386' 'x86_64')
url='http://www.sile-typesetter.org/'
license='custom'
source=("https://github.com/simoncozens/sile/archive/v${pkgver}.tar.gz"
	    "https://github.com/simoncozens/libtexpdf/archive/${_libtexpdf_ver}.tar.gz")
sha512sums=('c5f7e703a369ff976ad8399e162b4293db4e72e3c71fb389e950e0921f00614c0f89c1cff039e0ab3af444a7ebd15a3365b9448e3b4e5373040fd0adb281b7d7'
            '9cc2ade221251964fe600deadcaf28ab7488018fbb09f6a0fe0bd5d0d8950f3d232c8782369e8c88e75c776a577ca8451866ee86af8f0ab70dd7ca47ecb26715')

depends=('lua-lpeg'
         'lua-expat'
         'lua-filesystem'
         'fontconfig'
         'harfbuzz')

prepare () {
	cd "${pkgname}-${pkgver}"
	rm -rf libtexpdf
	cp -a ../libtexpdf-${_libtexpdf_ver} libtexpdf
	autoreconf --install
	(cd libtexpdf && autoreconf -I m4)
	sed 's/rm -f core/rm -f/' -i configure
}

build () {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}/"

	# Documentation and examples
	for file in README.md ROADMAP documentation/sile.pdf ; do
		install -Dm644 "${file}" \
			"${pkgdir}/usr/share/doc/${pkgname}/${file}"
	done
	cp -ar examples "${pkgdir}/usr/share/doc/${pkgname}"

	# License
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
