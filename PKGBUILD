# Maintainer: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode
pkgver=0.6.5
pkgrel=6
pkgdesc="Soundcloud client for the desktop"
arch=('x86_64' 'i686')
url="http://www.soundnodeapp.com/"
license=('GPL3')
conflicts=('soundnode', 'soundnode-app-bin')
provides=('soundnode')

# Required, otherwise it won't run.
options=('!strip')

depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libnotify' 'fontconfig')

# This thing requires wine to build, and just to create an icon for the win32 instance.
# Fails if it doesn't exist, so we better include it.
makedepends=('git' 'npm' 'wine' 'wine-mono' 'wine_gecko' 'nw-gyp')

source=("soundnode-app.zip::https://github.com/Soundnode/soundnode-app/archive/$pkgver.zip")
sha256sums=('2d075c4c802e34a37b0c9f71110157e754a22c978c3efa595feeb9059193154a')


build() {
	cd soundnode-app-"$pkgver"
	sed -i -e "s/\/usr\/share\/soundnode\/Soundnode/\/opt\/soundnode\/Soundnode/g" fpm/soundnode.desktop
	
	make build
}

package() {
	install -dm755 "$pkgdir"/usr/bin
        install -dm755 "$pkgdir"/opt/
        install -dm755 "$pkgdir"/usr/share/applications/
        install -Dm644 "$srcdir"/soundnode-app-"$pkgver"/fpm/soundnode.desktop "$pkgdir"/usr/share/applications/

	if [ -d "$srcdir"/build ]; then
		rm -r "$srcdir"/build
	fi

	mkdir "$srcdir"/build
	if [ $CARCH = "x86_64" ]; then
		cp -Lr "$srcdir"/soundnode-app-"$pkgver"/dist/Soundnode/linux64/* "$srcdir"/build
	else
		cp -Lr "$srcdir"/soundnode-app-"$pkgver"/dist/Soundnode/linux32/* "$srcdir"/build
	fi

        # We're creating a broken link here. It'll be fixed when all files are in place :)
        ln -s /opt/"$pkgname"/Soundnode "$pkgdir"/usr/bin/soundnode

	cp -Lr "$srcdir"/build "$pkgdir"/opt/"$pkgname"
}
