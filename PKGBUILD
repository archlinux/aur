# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.2.3
pkgrel=4
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('x86_64')
url="https://openshot.org/"
license=('LGPL3')
depends=('libmagick6' 'ffmpeg' 'x264' 'libopenshot-audio' 'python' 'libjsoncpp.so' 'qt5-multimedia' 'zeromq')
makedepends=('cmake' 'doxygen' 'swig' 'unittestpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot/archive/v$pkgver.tar.gz"
        "$pkgname-pr-209.patch::https://github.com/OpenShot/libopenshot/pull/209.patch")
sha256sums=('8536b0a790b0d98ed4c3b10e11d1b34ae68ccbc710887e3703a5143d95598746'
            '038b945763dc035ecffe0968a9f0f7a29bb86a3919f4192901d5f152eb5c7f89')

prepare() {
	cd ${pkgname}-${pkgver}

	patch -p1 -i "$srcdir/$pkgname-pr-209.patch"
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
