# Original Package: xpander <xpander0@gmail.com>
# Maintainer: Lubosz Sarnecki <lubosz0@gmail.com>

pkgname=lib32-glxosd-git
_gitname=glxosd
pkgver=r32.9f216b2
pkgrel=1
pkgdesc="An OSD for OpenGL applications running under the X Window System. This allows you to monitor your framerate and hardware temperature in games on Linux! 32bit version."
arch=('i686' 'x86_64')
url="https://github.com/nickguletskii/GLXOSD"
license=('GPL')
groups=()
depends=('mesa' 'glu' 'fontconfig' 'freetype2' 'lib32-lm_sensors' 'libxext')
makedepends=('cmake' 'gcc' 'git' 'boost' 'lib32-libxnvctrl')
checkdepends=()
optdepends=()
provides=('lib32-glxosd')
conflicts=('lib32-glxosd')
source=('git://github.com/nickguletskii/GLXOSD.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/GLXOSD"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cmake -DLIB_SUFFIX=32 -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles" 
  make all
}

package() {
  cd "$srcdir/GLXOSD"
  make DESTDIR="$pkgdir/" install
    mv -v ${pkgdir}"/usr/bin/glxosd" ${pkgdir}"/usr/bin/glxosd32"
	sed -i 's+/usr//lib/x86_64-linux-gnu//glxosd/+/usr/lib/glxosd+g' $pkgdir/usr/bin/glxosd32
	sed -i 's+/usr//lib/i386-linux-gnu//glxosd+/usr/lib/glxosd+g' $pkgdir/usr/bin/glxosd32
	rm ${pkgdir}/etc -R
	rm ${pkgdir}/usr/share -R
	mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32
}
