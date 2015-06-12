# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkg='wiLink'
pkgname='wilink'
pkgver='2.4.2'
pkgrel='4'
pkgdesc='Instant messaging client and SIP softphone for Wifirst customers'
arch=('i686' 'x86_64')
url='https://github.com/jlaine/wilink'
license=('GPL3')
depends=('libmad' 'libvorbis' 'libxss' 'qxmpp' 'qdjango' 'libnotify' 'libgnome-keyring' 'libgphoto2')
makedepends=('cmake>=2.8.2')
install="$pkgname.install"
source=("https://download.wifirst.net/public/${_pkg}-${pkgver}.tar.bz2"
	"link-X11.patch")
sha1sums=('a4c826c0a70c3ca0dcd953a2474f0ea576d0f9b1'
	  '42b07fdca0a26fe4e2c34c53b50158c60536266e')
 
build() {
	cd "$scrdir"
	
	# patching src/app/CMakeLists to solve an issue with an unlinked X11 library
	patch -p0 -i link-X11.patch
	
	# building
	cd "$_pkg-$pkgver/"
	[ -d build ] || mkdir build && cd "build/"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	# installing
	cd "$srcdir/$_pkg-$pkgver/build/"
	make DESTDIR="$pkgdir/" install

 	# setting up higher resolution icon
	rm "$pkgdir/usr/share/pixmaps/$_pkg.xpm"
	install -Dm644 ../src/data/images/128x128/$_pkg.png \
    	"$pkgdir/usr/share/pixmaps/$_pkg.png"
}
