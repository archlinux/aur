# Maintainer: Ray Powell <ray+archlinux@xphoniexx.net>
# Contributor: Joe Davison <joedavison.davison@gmail.com>

pkgname=wxlauncher
_pkgtar=wxLauncher
pkgver=0.11.0
pkgrel=1

source=("https://github.com/scp-fs2open/wxLauncher/archive/release-${pkgver}.zip"
	"wxlauncher.png"
	"wxlauncher.desktop")

sha256sums=('720385b6e0a77afa4ad746ae271a200afcecc74fce173f81c6a4f4aed98f7000'
            'e3bf9cbe7c61378026331a21313fccd891b051e949448715625d1cfd3ae72576'
            '8de688171c12fdf273ece4f33177fd773395204c81cf212f8c4293f0ddd16582')

pkgdesc="wxLauncher is a cross-platform launcher for the FreeSpace 2 Open engine"
url="https://github.com/scp-fs2open/wxLauncher"
#url="http://www.hard-light.net/forums/index.php?topic=67950.0"
arch=(i686 x86_64)
license=(GPL2)
# change below if you want to modify the resources intall directory.  The default installs it along side fs2_open resources.
resourcesdir=/opt/fs2_open/wxlauncher

depends=('wxpython' 'python' 'python-markdown' 'openal' 'sdl2' 'wxgtk2')
optdepends=('fs2_open')
makedepends=('cmake' 'python-setuptools')

#prepare() {
#}


build() {
	cd "$srcdir/${_pkgtar}-release-$pkgver"

		if [ ! -d build ]; then
			mkdir build
		fi

	cd build/
	
	# commence build		

	#cmake -DPYTHON_EXECUTABLE=python2 -DUSE_OPENAL=1 -DRESOURCES_PATH=$resourcesdir -DCMAKE_INSTALL_PREFIX=/usr ../
	cmake -DPYTHON_EXECUTABLE=python -DUSE_OPENAL=1 -DRESOURCES_PATH=$resourcesdir -DCMAKE_INSTALL_PREFIX=/usr ../ -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config' -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc'
	make
		

}

package() {
	cd "$srcdir/${_pkgtar}-release-$pkgver/build"
	make DESTDIR="$pkgdir/" install
	# need to install the .desktop file and icon
	cd "$srcdir"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
