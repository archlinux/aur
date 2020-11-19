# Maintainer:  Franc[e]sco <lolisamurai@tfwno.gf>
pkgname=('glxosd-fix-git' 'lib32-glxosd-fix-git')
_gitname=GLXOSD
pkgver=r209.dbb44b7
pkgrel=1
pkgdesc="(no nvidia proprietary dep, fix compile errors) An OSD for OpenGL applications running under the X Window System. This allows you to monitor your framerate and hardware temperature in games on Linux!"
arch=('i686' 'x86_64')
url="https://github.com/nickguletskii/GLXOSD"
license=('GPL')
makedepends=('cmake' 'gcc' 'git' 'boost')
source=('git://github.com/nickguletskii/GLXOSD.git' 'GLXOSD32::git://github.com/Phitherek/GLXOSD.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"
	git submodule init
	git submodule update --recursive
	patch --forward --strip=1 --input="${startdir}/glxosd-fix.patch"
	cd "$srcdir/${_gitname}32"
	git checkout 32bit
	git submodule init
	git submodule update --recursive
	patch --forward --strip=1 --input="${startdir}/glxosd-fix.patch"
}

build() {
	cd "$srcdir/$_gitname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles" 
	make all
	cd "$srcdir/${_gitname}32"
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export CMAKE_C_FLAGS='-m32'
	export CMAKE_CXX_FLAGS='-m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	cmake -DLIB_SUFFIX=32 -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles" 
	make all
}

package_glxosd-fix-git() {
	provides=('glxosd')
	conflicts=('glxosd')
	depends=('mesa' 'glu' 'fontconfig' 'freetype2' 'lm_sensors' 'libxext')
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

package_lib32-glxosd-fix-git() {
	provides=('lib32-glxosd')
	conflicts=('lib32-glxosd')
	depends=('lib32-mesa' 'lib32-glu' 'lib32-fontconfig' 'lib32-freetype2' 'lib32-lm_sensors'
		'lib32-libxext')
	cd "$srcdir/${_gitname}32"
	make DESTDIR="$pkgdir/" install
	sed -i 's+/usr//lib/x86_64-linux-gnu//glxosd/+/usr/lib/glxosd+g' $pkgdir/usr/bin/glxosd32
	sed -i 's+/usr//lib/i386-linux-gnu//glxosd+/usr/lib/glxosd+g' $pkgdir/usr/bin/glxosd32
	mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32
}
