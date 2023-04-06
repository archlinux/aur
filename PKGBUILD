# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=flashbrowser-git
_reponame=FlashBrowser
pkgver=0.81.r27.g0d97b17
pkgrel=3
pkgdesc="A browser dedicating to supporting adobe flash"
url="https://flash.pm/browser/"
arch=(any)
license=(unknown)
depends=(nodejs)
makedepends=(
	git
	npm
	imagemagick
)
provides=("flashbrowser-git=${pkgver}")
conflicts=('flashbrowser-git')
source=(
	git+https://github.com/radubirsan/FlashBrowser.git
	FlashBrowser.desktop
)
sha256sums=('SKIP'
            '33076411d47cf6bb214eb2b43654ca5d005b6c8e405e3f8db377bc148f042985')

pkgver() {
	git -C "$srcdir/$_reponame" describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir"
# create executable /usr/bin file
cat > FlashBrowser.sh <<EOF
#!/bin/sh
cd /usr/lib/node_modules/FlashBrowser
nohup npm run start &
EOF
}

build() {
	cd "$srcdir/$_reponame"
	npm install --legacy-peer-deps --cache "$srcdir/npm-cache"

	# remove all dotfiles and references to pkgdir
	find . -type f -name ".*" -delete
	find . -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}

package() {
	# install nodejs application
	install -d "$pkgdir/usr/lib/node_modules"
	cp -r --preserve=mode "$srcdir/$_reponame" "$pkgdir/usr/lib/node_modules"

	# install /usr/bin executable
	install -Dm755 "$srcdir/$_reponame.sh" "$pkgdir/usr/bin/$_reponame"

	# install icons
	for dirs in 16 24 32 48 256; do
		mkdir -p "$pkgdir/usr/share/icons/hicolor/${dirs}x${dirs}/apps"
	done

	for icons in 16 24 32 48 256; do
		if 	[ $icons = '16' ];	then layer=0;
		elif 	[ $icons = '24' ];	then layer=1;
		elif 	[ $icons = '32' ];	then layer=2;
		elif 	[ $icons = '48' ];	then layer=3;
		elif 	[ $icons = '256' ];	then layer=4; fi

	convert "$srcdir/$_reponame"/icon.ico[${layer}] -define icon:auto-resize=${icons} \
		"$pkgdir/usr/share/icons/hicolor/${icons}x${icons}/apps/${_reponame}.png"
	done

	# install desktop entry file
	install -Dm644 ../$_reponame.desktop \
		"$pkgdir/usr/share/applications/$_reponame.desktop"
}
