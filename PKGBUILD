# Maintainer: spider-mario <spidermario@free.fr>
pkgname=zyn-fusion
pkgver=3.0.5
pkgrel=1
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
        'BashCompletion.cmake')
sha512sums=('SKIP'
            'SKIP'
            '178a6e87ecac891f2b321123fc433a45a49b3c266b86c9fbe0c109e5c5ced447898ea55612e65a9689ff406fe5510efb1013dd12c7d2b10594b972154aceebbc')

prepare() {
	cd zynaddsubfx
	git submodule update --init
	# The original script does not honor DESTDIR. Replace it with a much more straightforward implementation.
	cp "$srcdir"/BashCompletion.cmake cmake/BashCompletion.cmake

	cd ../mruby-zest-build
	git submodule update --init
	make setup
}

build() {
	mkdir -p build-zynaddsubfx
	cd build-zynaddsubfx
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DGuiModule=zest ../zynaddsubfx
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
