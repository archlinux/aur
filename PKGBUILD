# Maintainer:  Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname='sile'
pkgdesc='Modern typesetting system inspired by TeX'
pkgver='0.9.4'
_libtexpdf_ver='0cb0c20a3ba40057e6902551300630fed7199bf6'
pkgrel='2'
arch=('i386' 'x86_64')
url='http://www.sile-typesetter.org/'
license=('MIT')
source=("https://github.com/simoncozens/sile/archive/v${pkgver}.tar.gz"
	    "https://github.com/simoncozens/libtexpdf/archive/${_libtexpdf_ver}.tar.gz")
sha512sums=('3d041f3e014f2d55f878f535d7ffd5b271b5aa2dc5f74e68261f1f1cdbdd18d7901c77a92a7701a91f7eefae71aa550167b441ced740dc4e459d29bcd8cc9e5e'
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
