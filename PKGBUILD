# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=libavio
pkgname=('python-avio')
pkgver=3.2.6
pkgrel=2
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
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'sdl2')
source=("git+${url}.git#commit=0fa1ccb5e7ec77199c9365e6a6e681a2570506ed"
        'git+https://github.com/pybind/pybind11.git')
sha256sums=('18876404d0cb7fdecb498aae9d7ad956053e981755cc198ae0268da4279b056e'
            'SKIP')

prepare() {
	cd ${srcdir}/${pkgbase}
	git submodule init pybind11
	git config submodule.pybind11.url "${srcdir}/pybind11"
	git -c protocol.file.allow=always submodule update pybind11
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
