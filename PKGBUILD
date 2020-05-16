# Mantainer: Alexandros Theodotou <alex at zrythm dot org>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Rafael Ferreira <josephgbr@archlinux.info>

_pkgbase=gtksourceview4
MINGW_PACKAGE_PREFIX=mingw-w64
pkgname=$MINGW_PACKAGE_PREFIX-$_pkgbase
pkgver=4.6.0
pkgrel=1
pkgdesc="A text widget adding syntax highlighting and more to GNOME (mingw-w64)"
arch=('any')
url="https://www.gnome.org"
license=("LGPL")
makedepends=("${MINGW_PACKAGE_PREFIX}-meson")
options=('!buildflags' '!strip' 'staticlibs')
depends=("${MINGW_PACKAGE_PREFIX}-gtk3"
         "${MINGW_PACKAGE_PREFIX}-libxml2")
source=("https://download.gnome.org/sources/gtksourceview/${pkgver%.*}/gtksourceview-${pkgver}.tar.xz")
sha256sums=('4c13e30ab2e602abdc56f55d35f43c1142a79b1cd77aa8839d2fc85e966d9a85')
_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
	cd "${srcdir}/gtksourceview-${pkgver}"

	 for _arch in "${_architectures[@]}"; do
		 mkdir -p build-${_arch} && pushd build-${_arch}
		  PKG_CONFIG="pkg-config" $_arch-meson \
		    -Dgtk_doc=false \
		    -Dgir=false \
		    ..
		  ninja
		  popd
	  done
}

package() {

	for _arch in "${_architectures[@]}"; do
      		DESTDIR="${pkgdir}" meson install -C ${srcdir}/gtksourceview-${pkgver}/build-${_arch}
	done
}
