# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: TryA <tryagainprod {at} gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libglade
pkgname=lib32-libglade
pkgver=2.6.4
pkgrel=7
pkgdesc="Allows you to load glade interface files in a program at runtime (32-bit)"
arch=('x86_64')
license=('LGPL')
depends=('lib32-gtk2' 'lib32-libxml2' "${_pkgbasename}")
makedepends=('python2' 'pkgconfig' 'gcc-multilib')
source=("https://download.gnome.org/sources/${_pkgbasename}/2.6/${_pkgbasename}-${pkgver}.tar.bz2"
        'libglade-2.0.1-nowarning.patch')
url='https://www.gnome.org'
sha512sums=('b725842febaf4c1f0d305a629ae1c61ea2de24dd6f41937e806c078fada2cea483195ef40f5238ce2045e47130c92559e984f677de667b840dd7fff0f8559735'
            '5ab9dfb85938fb7e9ec637a9d68f3db961f3986e1eb9eec0d684af4ce2361c83d6998283b2bd5b4e1bd7950ca456cc3ea7fae567ac52ae391f6c9d5456c6dd2e')

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd "${srcdir}/${_pkgbasename}-${pkgver}"
	patch -Np1 -i "${srcdir}/libglade-2.0.1-nowarning.patch"
	PYTHON=python2 ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var --libdir=/usr/lib32
	make
}

package() {
	cd "${srcdir}/${_pkgbasename}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm -rf ${pkgdir}/usr/{bin,include,share}
}
