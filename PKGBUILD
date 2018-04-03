# Maintainer: spider-mario <spidermario@free.fr>
pkgname=zyn-fusion
pkgver=3.0.3
pkgrel=4
pkgdesc="ZynAddSubFX with a new interactive UI"
arch=('i686' 'x86_64')
url="http://zynaddsubfx.sourceforge.net/zyn-fusion.html"
license=('GPL2' 'LGPL2.1')
depends=('fftw' 'libglvnd' 'mxml' 'jack' 'liblo' 'lash' 'alsa-lib' 'portaudio')
makedepends=('git' 'wget' 'cmake' 'python' 'ruby-rake'
             'glu' # For building pugl, which does not seem to actually need it at runtime
)
provides=('zynaddsubfx')
conflicts=('zynaddsubfx')
source=("git+https://github.com/zynaddsubfx/zynaddsubfx.git#tag=$pkgver"
        'git+https://github.com/mruby-zest/mruby-zest-build.git#commit=f98cdb072bb25bdcc2f5fe8370dce204b1149000')
sha512sums=('SKIP' 'SKIP')

prepare() {
	cd zynaddsubfx
	git submodule update --init

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
