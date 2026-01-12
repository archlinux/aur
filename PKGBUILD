# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=python-kankakee
pkgver=1.0.4
pkgrel=1
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
source=("git+${url}.git#commit=1ff32e08b7867e846ebf3254556dd3a489c2e5db"
        'git+https://github.com/pybind/pybind11.git')
sha256sums=('462c12e95b5cb79805fd79014bfd79cd431f3d356a2f5941c4726a437efac9de'
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
