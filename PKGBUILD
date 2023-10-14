# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=flashbrowser-git
_reponame=FlashBrowser
pkgver=0.81+r27+g0d97b17
pkgrel=2
pkgdesc="A browser dedicating to supporting adobe flash"
url="https://flash.pm/browser/"
arch=('any')
license=('unknown')
depends=('nodejs')
makedepends=('git' 'npm' 'imagemagick')
provides=('flashbrowser-git')
conflicts=('flashbrowser-git' 'flashbrowser-bin')
_commit=0d97b175eab39383bc83dba59c17bde1b55c7574  # tags/v0.8.1
source=("git+https://github.com/radubirsan/FlashBrowser#commit=$_commit"
	"FlashBrowser.desktop")
sha256sums=('SKIP'
            '33076411d47cf6bb214eb2b43654ca5d005b6c8e405e3f8db377bc148f042985')

pkgver() {
	git -C "$srcdir/$_reponame" describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
# Create executable /usr/bin file
cat > FlashBrowser.sh <<EOF
#!/bin/sh
cd /usr/lib/node_modules/FlashBrowser
nohup npm run start &
EOF
}

build() {
	cd $_reponame
	npm install --legacy-peer-deps --cache "$srcdir"/npm-cache

	# Remove all dotfiles, git folders and references to pkgdir
	find . -type f -name '.*' -delete
	find . -type d -name '.git*' | xargs rm -r
	find . -name 'package.json' -print0 | xargs -r -0 sed -i '/_where/d'
}

package() {
	# Install nodejs application
	install -d "$pkgdir"/usr/lib/node_modules
	cp -r --preserve=mode "$srcdir"/$_reponame "$pkgdir"/usr/lib/node_modules

	# Install /usr/bin executable
	install -Dm755 "$srcdir"/$_reponame.sh "$pkgdir"/usr/bin/$_reponame

	# Install icons
	for d in 16 24 32 48 256; do
		mkdir -p "$pkgdir"/usr/share/icons/hicolor/${d}x${d}/apps
	done

	for i in 16 24 32 48 256; do
		if 	[ $i = '16' ];	then layer=0;
		elif 	[ $i = '24' ];	then layer=1;
		elif 	[ $i = '32' ];	then layer=2;
		elif 	[ $i = '48' ];	then layer=3;
		elif 	[ $i = '256' ];	then layer=4; fi

	convert "$srcdir"/$_reponame/icon.ico[${layer}] -define icon:auto-resize=${i} \
		"$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/${_reponame}.png
	done

	# Install desktop entry file
	install -Dm644 ../$_reponame.desktop \
		"$pkgdir"/usr/share/applications/$_reponame.desktop
}
