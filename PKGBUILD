# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

_name='roboschool'
pkgname="${_name}-git"
pkgver=r37.1c323fc
pkgrel=5
pkgdesc='Robot simulation, integrated with OpenAI Gym.'
provides=(${_name})
url="https://github.com/openai/${_name}"
depends=('python-gym-git' 'qt5-base' 'assimp' 'tinyxml')
makedepends=('cmake' 'python-setuptools')
optdepends=('python-pyglet: run some demos s.a. demo_keyboard_humanoid2.py')
license=('MIT')
arch=('x86_64')

pkgver() {
  cd "${srcdir}/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=("git+${url}.git"
	"git+https://github.com/olegklimov/bullet3#branch=${_name}_self_collision")
	
sha256sums=('SKIP' 'SKIP')

build() {
	cd "${srcdir}/roboschool/roboschool/cpp-household"
	sed -i -e s/\$\(BOOST_PYTHON3_POSTFIX\)/3/g Makefile
	mkdir -p "${srcdir}/bullet3/build"
	cd "${srcdir}/bullet3/build"
	cmake -DBUILD_SHARED_LIBS=ON -DUSE_DOUBLE_PRECISION=1 \
		-DCMAKE_INSTALL_PREFIX:PATH=${srcdir}/${_name}/${_name}/cpp-household/bullet_local_install \
		-DBUILD_CPU_DEMOS=OFF -DBUILD_BULLET2_DEMOS=OFF \
		-DBUILD_EXTRAS=OFF -DBUILD_UNIT_TESTS=OFF -DBUILD_CLSOCKET=OFF \
		-DBUILD_ENET=OFF -DBUILD_OPENGL3_DEMOS=OFF ..
	make
	make install
	cd "${srcdir}/${_name}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	_pyver="$(python -c "import sys; print('%i.%i' % sys.version_info[:2])")"
	cp "${_name}/cpp_household.so" "${pkgdir}/usr/lib/python${_pyver}/site-packages/${_name}/"
	# copy examples
	mkdir -p "${pkgdir}/usr/share/doc/${_name}/"
	cp -r "${srcdir}/${_name}/agent_zoo" "${pkgdir}/usr/share/doc/${_name}/"
}
