# Maintainer: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode-git
pkgver=r774.3175946
pkgrel=5
pkgdesc="Soundcloud client for the desktop"
arch=('x86_64' 'i686')
url="http://www.soundnodeapp.com/"
license=('GPL3')
conflicts=('soundnode-git', 'soundnode-app-bin')
provides=('soundnode')

# Required, otherwise it won't run.
options=('!strip')

depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libnotify' 'fontconfig')

# This thing requires wine to build, and just to create an icon for the win32 instance.
# Fails if it doesn't exist, so we better include it.
makedepends=('git' 'npm' 'wine' 'wine-mono' 'wine_gecko' 'nw-gyp')

source=("git+https://github.com/Soundnode/soundnode-app.git")
sha256sums=("SKIP")

pkgver() {
	cd soundnode-app
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd soundnode-app
	sed -i -e "s/\/usr\/share\/soundnode\/Soundnode/\/opt\/soundnode-git\/Soundnode/g" fpm/soundnode.desktop
	
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
