# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=libavio
pkgname=('python-avio')
pkgver=3.2.6
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
source=("git+${url}.git#commit=6b1b89db63b5c3b516a38685fc36b264970c97fd")
sha256sums=('bf3f87c9756ed121e7658435958739f1127558a81c3c430ed6d49c4c7448c923')

prepare() {
	cd ${srcdir}/${pkgbase}
	sed -e 's,add_subdirectory(pybind11),find_package(pybind11 REQUIRED),' -i CMakeLists.txt
}

pkgver() {
	cd ${srcdir}/${pkgbase}
	sed -n -e '/libavio VERSION/p' CMakeLists.txt | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/${pkgbase}
	export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
	python -m build --wheel --no-isolation
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
