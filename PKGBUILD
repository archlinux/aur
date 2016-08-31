# Maintainer:  Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname='sile'
pkgdesc='Modern typesetting system inspired by TeX'
pkgver='0.9.4'
_libtexpdf_ver='0cb0c20a3ba40057e6902551300630fed7199bf6'
pkgrel='1'
arch=('i386' 'x86_64')
url='http://www.sile-typesetter.org/'
license=('MIT')
source=("https://github.com/simoncozens/sile/archive/v${pkgver}.tar.gz"
	    "https://github.com/simoncozens/libtexpdf/archive/${_libtexpdf_ver}.tar.gz")
sha512sums=('abe33136c960c15e79d018767019152a6dcd3a2b2527dc5fa10b322e0e8be0d404967390260c354b99c9c57a1139eaca879056da4c64f887d85ad9567fcec0fe'
            'da8a3d663385138fd2ba4306e190ea5294631f622cce4592198d75cd76109a31c2db24ede95e6adad98f29f952d3a1656a46b8ec9448f6146689f1b5763dd004')

depends=('lua-lpeg'
         'lua-expat'
         'lua-filesystem'
         'fontconfig'
         'harfbuzz>=1.3.0')

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
