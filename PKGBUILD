# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>
pkgname=boram
pkgver=0.5.4
pkgrel=1
pkgdesc="Cross-platform WebM converter"
arch=('x86_64')
url="https://github.com/Kagami/boram"
license=('CC0-1.0')
depends=('mpv' 'ffmpeg')
makedepends=('p7zip' 'python2' 'node-gyp')
source=(
	"https://github.com/Kagami/boram/releases/download/v$pkgver/$pkgname-v$pkgver-linux-x64.7z"
	"git+https://github.com/Kagami/nacl_sdk.git"
	"git+https://github.com/Kagami/boram.git#tag=v$pkgver"
)
md5sums=(
	'b907fc61a9cd1d7049812576f052515d'
	'SKIP'
	'SKIP'
)

build() {
	# Since video preview does not work with default release, we will have to build libboram.so by ourselves.

	# First of all we will need nacl for the build
	cd "$srcdir/nacl_sdk"
	rm -f ./python
	ln -s /usr/bin/python2 ./python	 #nacl needs python2 as python
	export PATH="$(pwd):$PATH"

	./naclsdk update
	export NACL_SDK_ROOT="$(pwd)/pepper_49"

	# Now we need to build boram with nody-gyp for the libboram.so, so that video preview would work
	cd "$srcdir/boram"
	node-gyp rebuild
}

package() {
	mkdir -p "$pkgdir/opt/"
	mkdir -p "$pkgdir/usr/bin/"
 
	cp -r "$srcdir/$pkgname-v$pkgver-linux-x64/" "$pkgdir/opt/$pkgname"
	cp    "$srcdir/boram/build/Release/boram.node" "$pkgdir/opt/$pkgname/resources/app/libboram.so"
 
	find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 -- {} +
	find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 -- {} +
  
	chmod 655 "$pkgdir/opt/$pkgname/boram"
	chmod 655 "$pkgdir/opt/$pkgname/resources/app/checklib"
  
	ln -s "/opt/$pkgname/boram" "$pkgdir/usr/bin/boram"
}
