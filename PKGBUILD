# Maintainer: Max Beikirch <max.beikirch (at) unitybox (dot) de>
pkgname=tor-shadow
pkgver=1.11.2
pkgrel=1
pkgdesc="an open-source network simulator/emulator hybrid (e.g. for Tor and Bitcoin)"
arch=('i686' 'x86_64')
url="https://shadow.github.io/"
license=('custom')
depends=('igraph>=0.5.4' 'glib2>=2.32.0')
makedepends=('llvm>=3.2' 'cmake>=2.8.8')
source=("https://github.com/shadow/shadow/archive/v$pkgver.tar.gz"
	"patch_addLLVM.patch"
	"patch_fix_build_dir.patch")
md5sums=('72a65ce92c311117fa80f9309824dfe3'
         'ad343433a279cc78a54f6eecffb92b36'
         'bc3c5e1e79c0fcf8600a30e2cb8e0fe0')

prepare() {	
	cd "shadow-$pkgver"
	patch -p1 -i "$srcdir/patch_addLLVM.patch"
	patch -p1 -i "$srcdir/patch_fix_build_dir.patch"
	mkdir -p build
}

build() {
	cd "shadow-$pkgver"
	python2 setup build --include /usr/lib/cmake/llvm --prefix "/usr"
	cd build
	cmake -DCMAKE_SKIP_INSTALL_RPATH=ON ..
	make
}

package() {
	cd "shadow-$pkgver/build"
	make DESTDIR="${pkgdir}" install

	mv "$pkgdir/usr/plugins/libshadow-plugin-tgen.so" "$pkgdir/usr/lib"
	rm -rf "$pkgdir/usr/plugins"

	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
