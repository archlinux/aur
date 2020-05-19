# Maintainer: Gavin Ridley <gavin.keith.ridley@gmail.com>
pkgname=openmc-git
pkgver=r11186.8bd8af53d
pkgrel=1
pkgdesc="Community-developed Monte Carlo neutron and photon transport simulation code"
arch=('any')
url="https://github.com/openmc-dev/openmc"
license=('MIT')
makedepends=('cmake' 'git' 'python-setuptools')
depends=('hdf5-cpp-fortran' 'python-numpy' 'python-matplotlib' 'python-scipy'
    'python-pandas' 'python-h5py' 'python-uncertainties' 'python-lxml')
provides=("${pkgname%-git}" "libopenmc.so")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
noextract=()
sha1sums=('SKIP')
pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    printf "build"
    printf "%s" "${pkgname}"
    printf "%s" "${pkgname%-git}"
	cd "${srcdir}/${pkgname}"
    git submodule update --init --recursive
    python setup.py build
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}
package() {
	cd "${srcdir}/${pkgname}/build"
	make DESTDIR="${pkgdir}" install
    cd ..
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
