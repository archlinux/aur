# Maintainer: Mirko Scholz <srtlg>
pkgname=cae-v-sim
pkgver=3.8.0
pkgrel=2
pkgdesc='V_Sim visualizes atomic structures such as crystals, grain boundaries and so on'
arch=('i686' 'x86_64')
url='https://www.mem-lab.fr/en/Pages/L_SIM/Softwares/V_Sim.aspx'
depends=('gtk3' 'ftgl' 'libyaml' 'libarchive' 'libmsym')
makedepends=('intltool' 'gtk-doc' 'gcc-fortran')
license=('custom:CeCILL')
source=("https://gitlab.com/l_sim/v_sim/-/archive/${pkgver}/v_sim-${pkgver}.tar.bz2")
sha1sums=('d0bb828b41883d2ada86d5c7c90af85d58020fa9')

prepare() {
	cd "${srcdir}/v_sim-${pkgver}"
	sed -i "s/flags='Wall W ansi'/flags=Wall/" configure.ac
	sed -i "s/flags_cpp='Wall W ansi'/flags=Wall/" configure.ac
	sed -i "s/static char\* strdup/static char* strdup_/" src/coreTools/atoms_yaml.c
	./autogen.sh
}

build() {
	cd "${srcdir}/v_sim-${pkgver}"
	./configure \
		--prefix=/usr \
		--enable-gtk-doc=yes --disable-introspection \
		--with-xsf --with-cube \
		--with-msym --with-msym-inc=-I/usr/include/libmsym \
		--without-strict-cflags
	make
}

package() {
	cd "${srcdir}/v_sim-${pkgver}"
	make DESTDIR="${pkgdir}" install
	
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	for lang in en fr
	do
		ln -s /usr/share/doc/v_sim/licence.${lang}.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.$lang
	done
}
