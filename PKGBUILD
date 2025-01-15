# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=libavio
pkgname=('libavio' 'python-avio')
pkgver=3.2.4
pkgrel=1
url='https://github.com/sr99622/libavio'
license=('Apache-2.0')
arch=('i686' 'x86_64')
makedepends=('cmake'
             'ffmpeg4.4'
             'git'
             'libavcodec.so'
             'libavformat.so'
             'libavutil.so'
             'libswresample.so'
             'libswscale.so'
             'pybind11'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'sdl2')
source=("git+${url}.git#commit=d0c2431383d5b4bb1d26204cb6fe50f678b065c4")
sha256sums=('3757dfc081d336111ac36bc1bbb2df5c24b43d60c8f5053c8c782fb530a7d86f')

prepare() {
	cd ${srcdir}/${pkgname}
	sed -e 's,add_subdirectory(pybind11),find_package(pybind11 REQUIRED),' -i CMakeLists.txt
}

pkgver() {
	cd ${srcdir}/${pkgname}
	sed -n -e '/libavio VERSION/p' CMakeLists.txt | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/${pkgbase}
	export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
	cmake -B build-so \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D WITHOUT_PYTHON=true \
		-W no-dev
	cmake --build build-so
	python -m build --wheel --no-isolation
}

package_libavio() {
	pkgdesc='Library for processing media streams designed for use in Onvif GUI'
	depends=('libavcodec.so'
	         'libavformat.so'
	         'libavutil.so'
	         'libswresample.so'
	         'libswscale.so'
	         'sdl2')

	cd ${srcdir}/${pkgbase}
	install -D -m 644 -t ${pkgdir}/usr/include include/avio.h
	install -D -m 755 -t ${pkgdir}/usr/lib build-so/${pkgname}.so.*
	cp -a build-so/${pkgname}.so ${pkgdir}/usr/lib/${pkgname}.so
}

package_python-avio() {
	pkgdesc='Python library for processing media streams designed for use in Onvif GUI'
	depends=('libavcodec.so'
	         'libavformat.so'
	         'libavutil.so'
	         'libswresample.so'
	         'libswscale.so'
	         'python'
	         'sdl2')

	cd ${srcdir}/${pkgbase}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
