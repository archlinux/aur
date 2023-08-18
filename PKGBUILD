# Maintainer: Sameer Puri <aur@purisa.me>
pkgname=python-or-tools
pkgver=9.7
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python>=3.6' 'swig' 'python-protobuf>=3.19.4' 'absl-py' 'python-numpy>=1.13.3')
makedepends=('cmake' 'wget' 'lsb-release' 'automake' 'python-wheel' 'python-pip' 'git' 'python-mypy-protobuf' 'python-virtualenv')
optdepends=('cplex: CPLEX solver support' 'python-pandas: used by some examples' 'python-matplotlib: used by some examples')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
b2sums=('ae4fa89665639894ae6feab9cb711fc493bbccecc4aa3f3cca290e28e1e77d043dbb7270567738ea6655c0daf2e8104ad08a96d2ef03959eb16eee71551eb987')

build() {
    cd "${srcdir}/or-tools-${pkgver}"
    if [ `pacman -Qi cplex &>/dev/null` ]; then
        cmake -S. -Bbuild -DBUILD_PYTHON:BOOL=ON -DUSE_CPLEX:BOOL=ON -DCPLEX_ROOT=/usr/lib/cplex
    else
	cmake -S. -Bbuild -DBUILD_PYTHON:BOOL=ON
    fi
    cmake --build build
}

package() {
    cd "${srcdir}/or-tools-${pkgver}"
    /usr/bin/pip --quiet install --root="$pkgdir" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(find -name 'ortools*whl')"
}
