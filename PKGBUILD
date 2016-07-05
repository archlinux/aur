# Package build for homegear plugin from git (https://www.homegear.eu/index.php/Main_Page)
# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgdesc='Homegear plugin for Homematic BidCos communication'
_gitname=('homegear-homematicbidcos')
pkgname=('homegear-homematicbidcos-git')
pkgver=0.6.138.96bda68
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/Homegear/homegear-homematicbidcos"
depends=('gcc-libs' 'homegear>=0.6.0')
makedepends=('gcc-libs' 'git')
conflicts=('homegear-homematicbidcos')
provides=('homegear-homematicbidcos')
source=("git+https://github.com/Homegear/homegear-homematicbidcos")
md5sums=('SKIP')

backup=(etc/homegear/families/homematicbidcos.conf)

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
	strip -s src/.libs/mod_homematicbidcos.so
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir/" install
	
	mkdir -p $pkgdir/etc/homegear/families
	cp -r "${srcdir}/${_gitname}/misc/Config Directory/homematicbidcos.conf" $pkgdir/etc/homegear/families
	
	mkdir -p $pkgdir/etc/homegear/devices
	cp -r "${srcdir}/${_gitname}/misc/Device Description Files" $pkgdir/etc/homegear/devices/0
}
