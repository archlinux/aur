# Maintainer: Chris Sakalis <chrissakalis@gmail.com>
pkgname=gimp-plugin-wavelet-sharpen
pkgver=0.1.2
commit=0e9924850e7a51518cb418a994d976c9dc99b012
pkgrel=2
pkgdesc="Enhances apparent sharpness of an image by increasing contrast in high frequency space."
arch=('i686' 'x86_64')
url="http://registry.gimp.org/node/9836"
license=('GPL')
groups=()
depends=('gimp')
provides=('wavelet-sharpen')
source=(https://github.com/gimp-plugins-justice/wavelet-sharpen/archive/${commit}.zip build_with_gcc10.patch)
md5sums=('cc3485184615ace479b2c74ced1411d5'
         'a922e26d92443a2ea56356fb799d3ef8')
sha256sums=('6eb6450639222ec57ce1dcf6098c5ea3455a7a033106b4c4670c4bf7f20adde8'
            '0ba1e8bda7db782f46be14345eb3dcb579657e6b7b03eaf38dec39d35b42f079')

prepare() {
	cd "$srcdir/wavelet-sharpen-$commit"
	sed -i "2s/LIBS.*/\0 -lm/g" src/Makefile

	# Needed for building with newer versions of GCC
	patch -p1 < ../build_with_gcc10.patch
}

build() {
	cd "$srcdir/wavelet-sharpen-$commit"
	make
}

package() {
	cd "$srcdir/wavelet-sharpen-$commit/po"
	for L in de ru it pl et;
	do
		install -Dm 0664 $L.mo "${pkgdir}/usr/share/locale/$L/LC_MESSAGES/gimp20-wavelet-sharpen-plug-in.mo"
	done
	cd "$srcdir/wavelet-sharpen-$commit/src"
	install -Dm 0755 wavelet-sharpen "${pkgdir}/usr/lib/gimp/2.0/plug-ins/wavelet-sharpen"
}
