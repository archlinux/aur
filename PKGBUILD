# Maintainer: Sulthan A. Karimov <sulthankarimov@gmail.com>
pkgname='blender-launcher-git'
_pkgname='blenderlauncher'
_pkgname1='Blender-Launcher-V2'
pkgver=v2.1.24.r6.g522706a
pkgtarget='_Linux_x64'
pkgrel=1
pkgdesc='Blender Launcher is a standalone software client that provides management for stable, daily and experimental builds of Blender 3D. It is a free open source project available for 64-bit Windows and Linux (GLIBC 2.31 and higher) operating systems.'
arch=('x86_64')
url='https://github.com/Victor-IX/Blender-Launcher-V2.git'
license=('GPL-3.0')
depends=('yay')
makedepends=('python-pdm-backend')
conflicts=('blender-launcher-bin')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname1/
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	yay -S --asdeps --noconfirm python39
	cd $srcdir/$_pkgname1/
	python3.9 -m venv lib
	source lib/bin/activate
	pip install --upgrade pdm
	pdm use lib/bin/python
	pdm venv activate
	pdm install
	python build_style.py
	sh build_linux.sh
}

package() {
	echo [Desktop Entry] >>$srcdir/$_pkgname.desktop
	echo Name=$_pkgname >>$srcdir/$_pkgname.desktop
	echo GenericName=Launcher >>$srcdir/$_pkgname.desktop
	echo Exec=/usr/bin/$_pkgname >>$srcdir/$_pkgname.desktop
	echo Terminal=false >>$srcdir/$_pkgname.desktop
	echo Icon=blenderlauncher >>$srcdir/$_pkgname.desktop
	echo Type=Application >>$srcdir/$_pkgname.desktop
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm755 "$srcdir/$_pkgname1/dist/release/Blender Launcher" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname1/source/resources/icons/bl/bl_128.png" "$pkgdir/usr/share/pixmaps/blenderlauncher.png"
	#install -Dm755 "$srcdir/$_pkgname1/dist/release/Blender Launcher" "$pkgdir$HOME/.local/bin/$_pkgname"
}
