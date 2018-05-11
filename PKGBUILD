# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

_name='roboschool'
pkgname="${_name}-git"
pkgver=r242.675f1ac4
pkgrel=3
pkgdesc='Robot simulation, integrated with OpenAI Gym.'
url="https://github.com/openai/${_name}"
depends=('python-gym-git' 'qt5-base' 'assimp' 'tinyxml')
makedepends=('cmake' 'python-setuptools' 'boost')
license=('MIT')
arch=('x86_64')

pkgver() {
  cd "${_name}-qt"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

source=("git+${url}.git"
	"git+https://github.com/olegklimov/bullet3#branch=${_name}_self_collision")
	
sha256sums=('SKIP' 'SKIP')

build() {
	cd "${srcdir}/roboschool/roboschool/cpp-household"
	sed -i -e s/\$\(BOOST_PYTHON3_POSTFIX\)//g Makefile
	mkdir -p "${srcdir}/bullet3/build"
	cd "${srcdir}/bullet3/build"
	cmake -DBUILD_SHARED_LIBS=ON -DUSE_DOUBLE_PRECISION=1 -DCMAKE_INSTALL_PREFIX:PATH=${srcdir}/${_name}/${_name}/cpp-household/bullet_local_install -DBUILD_CPU_DEMOS=OFF -DBUILD_BULLET2_DEMOS=OFF -DBUILD_EXTRAS=OFF  -DBUILD_UNIT_TESTS=OFF -DBUILD_CLSOCKET=OFF -DBUILD_ENET=OFF -DBUILD_OPENGL3_DEMOS=OFF ..
	make
	make install
	cd ${srcdir}/${_name}
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	_pyver="$(python -c "import sys; print('%i.%i' % sys.version_info[:2])")"
	cp "${_name}/cpp_household.so" "${pkgdir}/usr/lib/python${_pyver}/site-packages/${_name}/"
}
