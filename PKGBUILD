# Maintainer: éclairevoyant
# Contributor: Constantine Fedotov <zenflak@gmail.com>
# Contributor: aureolebigben <aureolebigben@gmail.com>
# Contributor: fleischie
# Contributor: auk
# Contributor: blind

pkgname=hyper
pkgver=3.4.0
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is/"
license=('MIT')
depends=('alsa-lib' 'electron20' 'gtk3' 'libxss' 'nss')
makedepends=('yarn' 'npm')
conflicts=('hyperterm')
replaces=('hyperterm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vercel/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
b2sums=('783b51d317d1560f9bcb69582a32f1b2342b874b1fce5beaf9de3d8a04c6a21407807cf9278b5659d4f366bd7f9fcc064618e3a6764c7fcbd4b914722acd7a3d'
        '3e204a5417c0c0b5d0de4b25013657e4f27ec951c4c23ad9c5bf661890bcf6e6b7f81454373c5740fc424c6af022a45e6b7f204dffb67afa678cf098c545b590')

_electron_file_list=(
	chrome-sandbox
	chrome_{1,2}00_percent.pak
	chrome_crashpad_handler
	libEGL.so
	libGLESv2.so
	libvk_swiftshader.so
	libvulkan.so.1
)

prepare() {
	cd $pkgname-$pkgver

	# delete husky install from postinstall
	sed -i 's/\ \&\& husky install//g' package.json

	yarn install
}

build() {
	cd $pkgname-$pkgver

	# This build command is the same as the one defined in package.json via
	# npm run dist except that it doesn't build for debian, rpm, etc. and
	# doesn't require some other dependencies

	# add node_modules binaries to PATH
	oldpath="$PATH"
	PATH="$(pwd)/node_modules/.bin:$PATH"

	yarn run build &&
	cross-env BABEL_ENV=production babel target/renderer/bundle.js \
		--out-file target/renderer/bundle.js \
		--no-comments \
		--minified target/renderer/bundle.js &&
	electron-builder --linux --dir

	PATH="$oldpath"

	# clean up bundled electron files
	for i in ${_electron_file_list[@]}; do
		rm dist/linux-unpacked/$i
	done
}

package() {
	install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"

	cd $pkgname-$pkgver
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 app/static/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -dm755 "$pkgdir/usr/lib/$pkgname/"
	cp -R dist/linux-unpacked/* "$pkgdir/usr/lib/$pkgname/"
	for i in ${_electron_file_list[@]}; do
		ln -s /usr/lib/electron/$i "$pkgdir/usr/lib/$pkgname/"
	done

	install -dm755 "$pkgdir/usr/bin/"
	ln -s /usr/lib/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}
