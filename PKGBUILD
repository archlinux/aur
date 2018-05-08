# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.1.9
pkgrel=6
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('x86_64')
url="http://openshot.org/"
license=('LGPL3')
depends=('libmagick6' 'ffmpeg' 'libx264' 'libopenshot-audio' 'python' 'jsoncpp' 'qt5-multimedia' 'zeromq')
makedepends=('cmake' 'doxygen' 'swig' 'unittestpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot/archive/v$pkgver.tar.gz"
https://github.com/OpenShot/libopenshot/commit/774eb365b3f663b1f53dd24c1650fafb3c445ea6.patch
ffmpeg-32-writer.patch ffmpeg-4.0.patch)
sha256sums=('2547969818092d77a1c742e27cf416b34b4d326abf6b089fc10b921f4a4141ec'
            'e0f56d40d4df0e4278d3cdb81923652b467c1a30e408bcff7a6b15327fb03548'
            '7dca1cfcdbc8c8cd039b6267623c822230e0d37968be2372520b36e22c782dd8'
            '5fcde03d9c04e4c3526f5b449171d1b42c572d1c882d1aeb2a4eb014b2c74137')

prepare() {
	cd ${pkgname}-${pkgver}

	# patches for ffmpeg 3.2
	patch -p1 -i "$srcdir/774eb365b3f663b1f53dd24c1650fafb3c445ea6.patch"
	patch -p1 -i "$srcdir/ffmpeg-32-writer.patch"

	# patches for ffmpeg 4.0
	# TODO https://github.com/OpenShot/libopenshot/issues/87
	patch -p1 -i "$srcdir/ffmpeg-4.0.patch"
	sed -i \
		-e 's#FF_INPUT_BUFFER_PADDING_SIZE#AV_INPUT_BUFFER_PADDING_SIZE#g' \
		-e 's#CODEC_FLAG_GLOBAL_HEADER#AV_CODEC_FLAG_GLOBAL_HEADER#g' \
		src/FFmpegWriter.cpp src/FFmpegReader.cpp
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
