# Maintainer: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode-git
pkgver=0.6.5
pkgrel=1
pkgdesc="Soundcloud client for the desktop"
arch=('x86_64' 'i686')
url="http://www.soundnodeapp.com/"
license=('GPL3')

# Required, otherwise it won't run.
options=('!strip')

depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libnotify' 'fontconfig')

# This thing requires wine to build, and just to create an icon for the win32 instance.
# Fails if it doesn't exist, so we better include it.
makedepends=('git' 'npm' 'wine')

source=("git+https://github.com/Soundnode/soundnode-app.git")
sha256sums=("SKIP")


build() {
	cd soundnode-app
	
	make build
}

package() {
	install -dm755 "$pkgdir"/usr/bin
        install -dm755 "$pkgdir"/opt/
        install -dm755 "$pkgdir"/usr/share/applications/
        install -Dm644 "$srcdir"/soundnode-app/fpm/soundnode.desktop "$pkgdir"/usr/share/applications/

	if [ -d "$srcdir"/build ]; then
		rm -r "$srcdir"/build
	fi

	mkdir "$srcdir"/build
	if [ $CARCH = "x86_64" ]; then
		cp -Lr "$srcdir"/soundnode-app/dist/Soundnode/linux64/* "$srcdir"/build
	else
		cp -Lr "$srcdir"/soundnode-app/dist/Soundnode/linux32/* "$srcdir"/build
	fi

        # We're creating a broken link here. It'll be fixed when all files are in place :)
        ln -s /opt/"$pkgname"/Soundnode "$pkgdir"/usr/bin/soundnode

	cp -Lr "$srcdir"/build "$pkgdir"/opt/"$pkgname"
}
