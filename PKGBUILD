# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=hal-git
pkgver=v3.3.0.r14.gccab704606
pkgrel=1
pkgdesc='The Hardware Analyzer for Hardware Reversing from emsec. (git version)'
arch=('x86_64')
url='https://github.com/emsec/hal'
license=('MIT')
depends=('lcov' 'gcovr' 'doxygen' 'boost' 'qt5-svg' 'libsodium' 'igraph' 'ninja' 'rapidjson' 'spdlog' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-jedi' 'python-pip' 'python-dateutil' 'pybind11')
optdepends=('graphviz: for documentation')
makedepends=('git' 'cmake' 'ccache' 'z3')
source=("$pkgname::git+https://github.com/emsec/hal.git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	sed -i 's:enable_cxx_compiler_flag_if_supported("-fcolor-diagnostics" "")::g' ./CMakeLists.txt
}

pkgver() {
	cd "$pkgname"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"

        mkdir -p build && cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr ..
        make
}

package() {
        cd "$pkgname/build"
        # install hal
        make DESTDIR="$pkgdir" install

        cd ..
        # install license
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hal/LICENSE"
}
