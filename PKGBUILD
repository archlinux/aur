#Maintainer: Leonard König <leonard dot r dot koenig at googlemail dot com>
pkgname='ducklauncher-git'
_gitname='launcher'
pkgver=r61.e160dd1
pkgrel=2
replaces=('ducklauncher')
arch=('i686' 'x86_64')
url="https://the-duck.github.io/"
depends=('python2-pyside' 'python2-xlib' 'pygtk' 'python2-wnck' 'python2-cssutils' 'hicolor-icon-theme' 'python2-simplejson' 'python2-xdg' 'python2-notify2' 'python2-pyqt4')
makedepends=('git')
license=('GPL2')
pkgdesc="Duck Launcher Application Laucher by Mark Spurgeon <markspurgeon96@hotmail.com>"
provides=(ducklauncher)
conflicts=(ducklauncher)
install=ducklauncher.install
source=("launcher::git+https://github.com/the-duck/launcher#branch=master"
	"duck-launcher.desktop"
	"ducklauncher.install")

md5sums=('SKIP'
         '95f61db7e9523f315f5898fe6f1eec10'
         'SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	## Make sure python2 is used withing the application instead of python
	sed -i 's@/usr/bin/python@/usr/bin/python2.7@' "$srcdir/$_gitname/bin/duck-launcher"
	sed -i 's@python@python2@' "$srcdir/$_gitname/bin/duck-launcher"
	find "$srcdir/$_gitname" -type f -name "*.py" -exec sed -i 's@/usr/bin/python@/usr/bin/python2.7@' {} \;
	find "$srcdir/$_gitname/duck_launcher" -type f -name "*.pyc" -exec rm {} \;

	## Patch Window.py to include from PIL import Image instead of just import Image (which is broken in Arch)
	sed -i 's@import Image@from PIL import Image@' "$srcdir/$_gitname/duck_launcher/Window.py"
}


package() {
	## Install executables
	mkdir -p "$pkgdir/usr/lib/"
#	mkdir -p "$pkgdir/usr/bin"
	cp -dr --no-preserve=ownership "$srcdir/$_gitname/duck_launcher" "$pkgdir/usr/lib/duck_launcher"
	cp -dr --no-preserve=ownership "$srcdir/$_gitname/duck_settings" "$pkgdir/usr/lib/duck_settings"
	cp -dr --no-preserve=ownership "$srcdir/$_gitname/bin/" "$pkgdir/usr/bin/"

	## Install icons
	mkdir -p "$pkgdir/usr/share/duck-launcher"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
#	cp -dr --no-preserve=ownership "$srcdir/$_gitname/icons" "$pkgdir/usr/share/duck-launcher/"
	cp -dr --no-preserve=ownership "$srcdir/$_gitname/default-theme" "$pkgdir/usr/share/duck-launcher/default-theme"

	## Workaround the application actually wanting to have the icons there.
	cp -dr --no-preserve=ownership "$srcdir/$_gitname/default-theme" "$pkgdir/usr/share/duck-launcher/"

	cp --no-preserve=ownership "$srcdir/$_gitname/icons/duck-launcher.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	cp --no-preserve=ownership "$srcdir/$_gitname/icons/duck-settings.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

	## Install Plugin Folder
#	mkdir -p "$pkgdir/usr/share/duck-launcher"
	cp -dr --no-preserve=ownership "$srcdir/$_gitname/plugins" "$pkgdir/usr/share/duck-launcher/plugins"

	## Install Desktop File
	mkdir -p "$pkgdir/usr/share/applications"
	cp -dr --no-preserve=ownership "$srcdir/../duck-launcher.desktop" "$pkgdir/usr/share/applications"
}
