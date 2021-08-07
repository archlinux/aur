# Maintainer: spider-mario <spidermario@free.fr>
pkgname=zyn-fusion
pkgver=3.0.5
pkgrel=4
pkgdesc="ZynAddSubFX with a new interactive UI"
arch=('i686' 'x86_64')
url="http://zynaddsubfx.sourceforge.net/zyn-fusion.html"
license=('GPL2' 'LGPL2.1')
depends=('fftw' 'libglvnd' 'mxml' 'jack' 'liblo' 'alsa-lib' 'portaudio')
makedepends=('git' 'wget' 'cmake' 'python' 'ruby-rake'
             'glu' # For building pugl, which does not seem to actually need it at runtime
             'python2' # Also for pugl
)
provides=('zynaddsubfx')
conflicts=('zynaddsubfx')
source=("git+https://github.com/zynaddsubfx/zynaddsubfx.git#tag=$pkgver"
        "git+https://github.com/mruby-zest/mruby-zest-build.git#tag=$pkgver"
        'BashCompletion.cmake'
        'gcc10.patch'
        'file-picker.patch'
        'mruby.patch'
        'mruby-dir-glob.patch'
        'parameter-ranges.patch')
b2sums=('SKIP'
        'SKIP'
        '14be130e88c2e1d2b8312ca9f6d426834a26360594ed9ed22222a98603e1d5a51e86450911c76563545f55a80952c7dfb05a251e36d59684527caccdf976c474'
        '1f41e7a0a50f1f11a4853bd8d8daea5f4510b567381768a8bc61e15082aa668f924e3d6787cbb93a16eee2da2a34a5d20f18e69399718166d6b9d3f47b648987'
        'd99df6908b1af24d018726b6b737f13cbcd153deb5667e03ea3e138f22c83c237f70921dec58e739486acb3a488965858cb60ab140e00e30f6fb80833af1401d'
        '2b2c9523cea9fe5063355e831ed154ffc82cfded3afac28f5f7fda4c392a152fc859af875b51a1ce763a877676d1573d74eaa11c713d8d61c78ebb7740e51544'
        '23a20e603b6da0fc65665e83669d4b4ec784b2c3a4fa1edead2003c7ee8a1b7b5d13655ecb6fcb3f430d36fd0074ba68c2e5fa4a3aba07e06b1c2ae077090795'
        'f53c8142a3f3a77d37348537e8ac36be36b0003d5bf0d5214fb4ca9cece253d25d57d9bdddd19c4545671a03ea499365ef629a461582fd3d24c8b174b5c45f29')

prepare() {
	cd zynaddsubfx
	git submodule update --init
	# The original script does not honor DESTDIR. Replace it with a much more straightforward implementation.
	cp "$srcdir"/BashCompletion.cmake cmake/BashCompletion.cmake

	git apply -3 "$srcdir"/file-picker.patch
	git apply -3 "$srcdir"/parameter-ranges.patch

	cd ../mruby-zest-build
	git submodule update --init
	git apply -3 "$srcdir"/gcc10.patch
	pushd mruby
	git apply -3 "$srcdir"/mruby.patch
	popd
	pushd deps/mruby-dir-glob
	git apply -3 "$srcdir"/mruby-dir-glob.patch
	popd
	
	make setup
}

build() {
	mkdir -p build-zynaddsubfx
	cd build-zynaddsubfx
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DGuiModule=zest ../zynaddsubfx
	make

	cd ../mruby-zest-build
	make builddep
	make
	make pack
}

package() {
	install -Dm644 zynaddsubfx/COPYING "$pkgdir"/usr/share/licenses/zynaddsubfx/COPYING
	cd build-zynaddsubfx
	make DESTDIR="$pkgdir/" install

	cd ../mruby-zest-build

	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

	install -d "$pkgdir"/opt/"$pkgname"
	install -m755 package/zest "$pkgdir"/opt/"$pkgname"/zyn-fusion
	cp -a package/{libzest.so,font,schema} "$pkgdir"/opt/"$pkgname"/
	install -d "$pkgdir"/opt/"$pkgname"/qml
	touch "$pkgdir"/opt/"$pkgname"/qml/MainWindow.qml

	ln -s /opt/"$pkgname"/zyn-fusion "$pkgdir"/usr/bin/
}
