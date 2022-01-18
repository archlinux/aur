# Maintainer: Mirko Scholz <srtlg>
pkgname=cae-v-sim
pkgver=3.8.0
pkgrel=1
pkgdesc='V_Sim visualizes atomic structures such as crystals, grain boundaries and so on'
arch=('i686' 'x86_64')
url='http://inac.cea.fr/L_Sim/V_Sim/index.en.html'
depends=('gtk3' 'ftgl' 'libyaml' 'libarchive')
makedepends=('intltool' 'gtk-doc' 'gcc-fortran')
license=('custom:CeCILL')
source=("https://gitlab.com/l_sim/v_sim/-/archive/${pkgver}/v_sim-${pkgver}.tar.bz2")
sha1sums=('d0bb828b41883d2ada86d5c7c90af85d58020fa9')

build() {
	cd "${srcdir}/v_sim-${pkgver}"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--enable-gtk-doc=no --disable-introspection \
		--with-xsf --with-cube
	make
}

package() {
	cd "${srcdir}/v_sim-${pkgver}"
	make DESTDIR="${pkgdir}" install
	for i in usr/share/gtk-doc usr/share/gir-1.0 usr/lib/girepository-1.0 usr/lib/python
	do
		rm -rf "${pkgdir}/$i"
	done
	
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	for lang in en fr
	do
		ln -s /usr/share/doc/v_sim/licence.${lang}.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.$lang
	done
}
