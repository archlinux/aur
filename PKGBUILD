# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=libavio
pkgname=('python-avio')
pkgver=3.2.7
pkgrel=1
url='https://github.com/sr99622/libavio'
license=('Apache-2.0')
arch=('i686' 'x86_64')
makedepends=('cmake'
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
source=("git+${url}.git#commit=3d3c89c4722efa1cc7c05f528c296f2acba8e73e"
        'git+https://github.com/pybind/pybind11.git')
sha256sums=('a8793e266b563c897ca84b3ee8ea4fd19ef40ab43c7115c2a6c38a1607eb3a91'
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
