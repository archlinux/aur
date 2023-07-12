# Maintainer: Achmad Fathoni<fathoni(dot)id(at)gmail(dot)com>
pkgname=python-ouster-sdk
pkgver=20230710
pkgrel=2
pkgdesc="Ouster Python SDK"
arch=(any)
url="https://github.com/ouster-lidar/ouster_example"
license=('BSD')
makedepends=('python-setuptools' 'python-pytest' 'python-build' 'python-installer' 'pybind11' 'jsoncpp' 'cmake' 'eigen' 'python-wheel')
depends=('python' 'python-typing_extensions' 'libtins' 'python-numpy' 'glew' 'glfw-x11' 'spdlog')
checkdepends=('python-tox')
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('07e64ad3dc831924a3c57aae6a36e3297937a1231689dc4344a841b7a24052bb')
_dir=ouster_example-${pkgver}/python

prepare() {
    cd ${srcdir}/${_dir}
    perl -pe "s/,(?!.*,).*?(?=])// if $. == 4" -i pyproject.toml
    sed -i "2d" tox.ini
}

build() {
    cd ${srcdir}/${_dir}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_dir}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

check() {
    tox -c ${srcdir}/${_dir}
}
