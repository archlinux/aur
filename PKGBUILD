# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.2.0
pkgrel=4
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('x86_64')
url="http://openshot.org/"
license=('LGPL3')
depends=('libmagick6' 'ffmpeg' 'x264' 'libopenshot-audio' 'python' 'jsoncpp' 'qt5-multimedia' 'zeromq')
makedepends=('cmake' 'doxygen' 'swig' 'unittestpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot/archive/v$pkgver.tar.gz"
        ffmpeg-4.0.patch)
sha256sums=('f6f79c18023253720698c3049a0cd4b5783354cfbc6345e736e15268be6e297d'
            '38873ed7cd231f0f401b6138c98c85605c70a10f51e3f914dcf15f479ed8e893')

prepare() {
	cd ${pkgname}-${pkgver}

	patch -p1 -i "$srcdir/ffmpeg-4.0.patch"
}

build() {
	cd ${pkgname}-${pkgver}
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 \
	      -DUSE_SYSTEM_JSONCPP=ON -DENABLE_RUBY=OFF ../
	make
}

package() {
	cd ${pkgname}-${pkgver}
	cd build
	make DESTDIR="${pkgdir}" install
}
