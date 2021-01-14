# Contributor: Hy Goldsher <hyness-at-freshlegacycode-dot-org>
pkgname=retrofe
pkgver=0.10.0
pkgrel=2
pkgdesc="A cross-platform frontend designed for MAME cabinets/game centers/etc. with a focus on simplicity and customization"
arch=('i686' 'x86_64')
url="http://retrofe.nl"
license=('GPL3')
depends=('glib2' 'zlib' 'gstreamer' 'gst-plugins-base' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('cmake' 'git' 'python2')
source=('git+https://github.com/phulshof/RetroFE.git#branch=master'
	$pkgname.desktop
	'icon.png')
md5sums=('SKIP' 
	'd98dfab0f0209e18769191d5755b2feb' 
	'229f9ddd063de953ab165ab10ce73717')
install=$pkgname.install
_gitproject=RetroFE

build() {
	cd $_gitproject
	cmake RetroFE/Source -BRetroFE/Build -DVERSION_MAJOR=0 -DVERSION_MINOR=0 -DVERSION_BUILD=0
	cmake --build RetroFE/Build
	python Scripts/Package.py --os=linux --build=full
}
package() {
	install -d $pkgdir/{opt,usr/bin}
        install -dm777 $pkgdir/opt/retrofe
	cp -r $srcdir/$_gitproject/Artifacts/linux/RetroFE/* $pkgdir/opt/retrofe
        chmod -R a+w $pkgdir/opt/retrofe/{collections,layouts,launchers}
	ln -s /opt/retrofe/$pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 $srcdir/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
	install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/$pkgname.png
}
