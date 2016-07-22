# Maintainer:  Maxime Poulin <maxpoulin64@gmail.com>
# Controbutor: xpander <xpander0@gmail.com>
pkgname=glxosd
_gitname=GLXOSD
pkgver=3.2.0
pkgrel=1
pkgdesc="An OSD for OpenGL applications running under the X Window System. This allows you to monitor your framerate and hardware temperature in games on Linux!"
arch=('i686' 'x86_64')
url="https://github.com/nickguletskii/GLXOSD"
license=('GPL')
depends=('mesa' 'glu' 'fontconfig' 'freetype2' 'lm_sensors' 'libxext')
makedepends=('cmake' 'gcc' 'git' 'boost' 'libxnvctrl')
source=("git+https://github.com/nickguletskii/GLXOSD.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$_gitname"
	git submodule init
	git submodule update --recursive
}

build() {
	cd "$srcdir/$_gitname"
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
	
	chmod 0555 "$pkgdir/usr/bin/glxosd"
}
