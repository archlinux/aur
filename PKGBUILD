# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=python-kankakee
pkgver=1.0.3
pkgrel=2
pkgdesc='Server/Client python module for Onvif GUI'
url='https://github.com/sr99622/kankakee'
license=('Apache-2.0')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('cmake'
             'git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("git+${url}.git#commit=e53ad5ad0cdce83904213b0dd5a0fcad87193023"
        'git+https://github.com/pybind/pybind11.git')
sha256sums=('8fa32a386bcbe3b3fb964eee1f4d269042ed7506fe047d879b536af421dccd49'
            'SKIP')

prepare() {
	cd ${srcdir}/${pkgname#*-}
	git submodule init pybind11
	git config submodule.pybind11.url "${srcdir}/pybind11"
	git -c protocol.file.allow=always submodule update pybind11
}

pkgver() {
	cd ${srcdir}/${pkgname#*-}
	sed -n -e '/kankakee VERSION/p' CMakeLists.txt | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/${pkgname#*-}
	python -m build --wheel --no-isolation
}

package() {
	cd ${srcdir}/${pkgname#*-}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
