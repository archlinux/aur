# Maintainer:  Franc[e]sco <lolisamurai@tfwno.gf>
pkgname=glxosd-fix-git
provides=('glxosd-git')
_gitname=GLXOSD
pkgver=r209.dbb44b7
pkgrel=1
pkgdesc="(no nvidia proprietary dep, fix compile errors) An OSD for OpenGL applications running under the X Window System. This allows you to monitor your framerate and hardware temperature in games on Linux!"
arch=('i686' 'x86_64')
url="https://github.com/nickguletskii/GLXOSD"
license=('GPL')
depends=('mesa' 'glu' 'fontconfig' 'freetype2' 'lm_sensors' 'libxext')
makedepends=('cmake' 'gcc' 'git' 'boost')
provides=('glxosd')
conflicts=('glxosd')
source=('git://github.com/nickguletskii/GLXOSD.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"
	git submodule init
	git submodule update --recursive
	patch --forward --strip=1 --input="${startdir}/glxosd-fix.patch"
}

build() {
	cd "$srcdir/GLXOSD"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles" 
	make all
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
	
	if [ -d "$pkgdir/usr/lib64" ]; then
		mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	fi
	
	sed -i 's+/usr//lib/x86_64-linux-gnu//glxosd/+/usr/lib/glxosd+g' \
		"$pkgdir/usr/bin/glxosd"
	sed -i 's+/usr//lib/i386-linux-gnu//glxosd+/usr/lib/glxosd+g' \
		"$pkgdir/usr/bin/glxosd"
}
