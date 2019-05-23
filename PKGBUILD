# Maintainer: Justin Jagieniak <justin@jagieniak.net>

pkgname=high-fidelity-bin
pkgver=0.82.1
pkgrel=1.0
pkgdesc="High Fidelity (Hifi) is an open-source software where you can create and share virtual reality (VR) experiences. Create and host your own VR world, explore other worlds and meet other users. Binaries only!"
arch=('i686' 'x86_64')
url="https://github.com/highfidelity/hifi"
license=('Apache')
install="${pkgname}.install"
_gitname=hifi-packages

provides=('hifi')  
conflicts=('hifi')
_qt5version=5.10.1 
depends=("qt5-base>=$_qt5version"
         "qt5-script>=$_qt5version"
         "qt5-tools>=$_qt5version"
         "qt5-multimedia>=$_qt5version"
         "qt5-svg>=$_qt5version"
         "qt5-websockets>=$_qt5version"
         "qt5-webengine>=$_qt5version"
         "qt5-graphicaleffects>=$_qt5version"
         "qt5-quickcontrols>=$_qt5version"
         "qt5-xmlpatterns>=$_qt5version"
         "quazip"
)

source=(
	'hifi-interface.desktop'
	'hifi-interface.png'
	'hifi-interface'
	'hifi-assignment-client'
	'hifi-domain-server'
	'hifi-ice-server'
	"$_gitname::git+https://github.com/Justinizer/$_gitname.git"
)

md5sums=(
	"9199bdb8e4e32bc16b90fe0d29c4ea7a"
	"a261965ec09a8dfd93175fdabb7cafbe"
	"ff5de09932f33f6e4f4e4093a4b5e1d8"
	"1eac79a3bc2179a4026ea1c6765fd44a"
	"ebb90bc133cb39d9d53b22fe8a954126"
	"8405ec1a861b25e92c9640cdae8a3776"
	"SKIP"
)

package() {
	mkdir -p "$pkgdir/usr/share/hifi"
	mkdir -p "$pkgdir/usr/lib"
 	mkdir -p "$pkgdir/opt"

 	tar -xvf "$srcdir/$_gitname/hifi.tar.xz" -C "$pkgdir/opt/"
 	tar -xvf "$srcdir/$_gitname/libraries.tar.gz" -C "$pkgdir/usr/lib/"

	#copy polyvox library
	cd "$pkgdir/usr/lib"
	ln -s "libPolyVoxCore.so.0.2.1" "libPolyVoxCore.so.0"
	ln -s "libPolyVoxCore.so.0.2.1" "libPolyVoxCore.so"

	ln -s "libPolyVoxUtil.so.0.2.1" "libPolyVoxUtil.so.0"
	ln -s "libPolyVoxUtil.so.0.2.1" "libPolyVoxUtil.so"

	install -Dm644 "$srcdir/hifi-interface.png" "$pkgdir/usr/share/hifi/hifi-interface.png"
	install -Dm644 "$srcdir/hifi-interface.desktop" "$pkgdir/usr/share/applications/hifi-interface.desktop"
	install -Dm755 "$srcdir/hifi-interface" "$pkgdir/usr/bin/hifi-interface"

	install -Dm755 "$srcdir/hifi-domain-server" "$pkgdir/usr/bin/hifi-domain-server"

	install -Dm755 "$srcdir/hifi-ice-server" "$pkgdir/usr/bin/hifi-ice-server"

	install -Dm755 "$srcdir/hifi-assignment-client" "$pkgdir/usr/bin/hifi-assignment-client"
}