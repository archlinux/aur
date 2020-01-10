# Maintainer: Simon Allen <simon@simonallen.org>

pkgname=ytmdesktop-git
_name=ytmdesktop
pkgver=1.8.0
pkgrel=2
pkgdesc="A desktop app for YouTube Music"
arch=('any')
url="https://ytmdesktop.app"
depends=('gtk3' 'nss' 'libxss')
makedepends=('git' 'npm')
optdepends=('gnome-keyring' 'lsb-release' 'avahi' 'nss-mdns')
provides=('ytmdesktop')
conflicts=()
license=('CCPL')

source=('git+https://github.com/ytmdesktop/ytmdesktop.git'
        'ytmdesktop.desktop')
md5sums=('SKIP'
         '63a9f7d805c871f6556aa0e1aa0ef74c')

pkgver() {
	cd "$srcdir/$_name"
	git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

build() {
	cd "$srcdir/$_name"
	rm -rf node_modules
	npm install

	if [ $CARCH = "x86_64" ]; then
		env ELECTRON_BUILDER_ALLOW_UNRESOLVED_DEPENDENCIES=true npm run pack:x64
	elif [ $CARCH = "i686" ]; then
		env ELECTRON_BUILDER_ALLOW_UNRESOLVED_DEPENDENCIES=true npm run pack
	fi
}

package() {
	cd $pkgdir
	distdir="$srcdir/$_name/dist/linux-unpacked"
	mkdir -p usr/bin usr/share/applications usr/share/doc/ytmdesktop usr/share/pixmaps usr/share/ytmdesktop

	# copy license
	cp "$distdir"/LICENSE* usr/share/doc/ytmdesktop

	# copy icon
	cp "$srcdir/$_name/assets/favicon.512x512.png" usr/share/pixmaps/ytmdesktop.png

	# copy application
	cp -r "$distdir"/* usr/share/ytmdesktop

	# link binary
	ln -s "/usr/share/ytmdesktop/youtube-music-desktop-app" "usr/bin/ytmdesktop"

	# create desktop entry
	cp $srcdir/ytmdesktop.desktop usr/share/applications
}
