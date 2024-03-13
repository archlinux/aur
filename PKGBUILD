# Maintainer: Sameer Puri <aur@purisa.me>
pkgname=python-or-tools
pkgver=9.9
pkgrel=2
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python>=3.6' 'swig' 'python-protobuf>=3.19.4' 'absl-py' 'python-numpy>=1.13.3')
makedepends=('cmake' 'wget' 'lsb-release' 'automake' 'python-wheel' 'python-pip' 'git' 'python-mypy-protobuf' 'python-virtualenv')
optdepends=('cplex: CPLEX solver support' 'python-pandas: used by some examples' 'python-matplotlib: used by some examples')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
b2sums=('be3e813e57140c97f451223e481f57085494294e65f5e1c4df1a3429f0bc56d0e6e2145fa41977d4aa98f3765b24a0341863b77926257464bf2ae64858b22186')

build() {
    cd "${srcdir}/or-tools-${pkgver}"
    if [ `pacman -Qi cplex &>/dev/null` ]; then
        cmake -S. -Bbuild -DBUILD_PYTHON:BOOL=ON -DBUILD_CXX_SAMPLES=OFF -DBUILD_CXX_EXAMPLES=OFF -DUSE_CPLEX:BOOL=ON -DCPLEX_ROOT=/usr/lib/cplex
    else
	cmake -S. -Bbuild -DBUILD_PYTHON:BOOL=ON -DBUILD_CXX_SAMPLES=OFF -DBUILD_CXX_EXAMPLES=OFF
    fi
    cmake --build build --config Release --target all
}

package() {
    cd "${srcdir}/or-tools-${pkgver}"
    /usr/bin/pip --quiet install --root="$pkgdir" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(find -name 'ortools*whl')"
}
