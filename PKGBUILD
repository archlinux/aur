# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=spinecreator-git
pkgver=0.9.6+gite6f3b58
pkgrel=1
pkgdesc="A user interface for creating neural network simulations"
arch=(i686 x86_64)
url="https://github.com/SpineML/SpineCreator.git"
license=('GPL3')
depends=(brahms qt5-base graphviz)
makedepends=(git cmake)
provides=("spinecreator")
conflicts=("spinecreator")
source=("git+https://github.com/SpineML/SpineML_PreFlight.git"
        "git+https://github.com/SpineML/SpineML_2_BRAHMS.git"
		"git+https://github.com/SpineML/SpineCreator.git")
noextract=()
md5sums=(SKIP SKIP SKIP)
validpgpkeys=()

pkgver() {
	echo 0.9.6+git$(git rev-parse --short HEAD)
}

build() {
	# Make SpineML_PreFlight
	cd SpineML_PreFlight
	rm -rf build
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
	cd ../..

	# Make SpineCreator
	cd SpineCreator
	qmake
	make
}

package() {
	# Install SpineML_PreFlight
	cd SpineML_PreFlight/build
	make DESTDIR="$pkgdir" install
	cd ../..

	# Install SpineCreator
	cd SpineCreator
	make INSTALL_ROOT="$pkgdir/" install
	cd ..

	# Install SpineML_2_BRAHMS scripts
	mkdir -p "$pkgdir/opt/SpineML_2_BRAHMS"
	cp -R SpineML_2_BRAHMS/* "$pkgdir/opt/SpineML_2_BRAHMS"
}
