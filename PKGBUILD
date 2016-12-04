# Package build for homegear plugin from git (https://www.homegear.eu/index.php/Main_Page)
# Maintainer: Ronny <ronny-aur[at]adke*org>

pkgdesc='Homegear plugin for Enocean communication'
_gitname=('Homegear-EnOcean')
pkgname=('homegear-enocean-git')
pkgver=0.6.21.2009e63
pkgrel=1
arch=('armv7h' 'x86_64')
license=('GPL')
url="https://github.com/Homegear/Homegear-EnOcean"
depends=('gcc-libs' 'homegear>=0.6.0')
makedepends=('gcc-libs' 'git')
provides=('homegear-enocean')
source=("git+https://github.com/Homegear/Homegear-EnOcean")
md5sums=('SKIP')

backup=(etc/homegear/families/enocean.conf)

pkgver() {
	cd "$srcdir"/${_gitname}
	echo "0.6.$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
	cd "${srcdir}/${_gitname}"
}

build() {
	cd "${srcdir}/${_gitname}"
	rm -Rf autom4te.cache
	./bootstrap || exit 1
	
	# Remove qdbm dependency
	sed -i 's/-lqdbm//g' src/Makefile.am
	
	./configure --with-php=/usr --prefix=/usr --localstatedir=/var --sysconfdir=/etc --libdir=/usr/lib || exit 1
	make || exit 1
	strip -s src/.libs/mod_enocean.so
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir/" install
	
	mkdir -p $pkgdir/etc/homegear/families
	cp -r "${srcdir}/${_gitname}/misc/Config Directory/enocean.conf" $pkgdir/etc/homegear/families
	
	mkdir -p $pkgdir/etc/homegear/devices
	cp -r "${srcdir}/${_gitname}/misc/Device Description Files" $pkgdir/etc/homegear/devices/15
}
