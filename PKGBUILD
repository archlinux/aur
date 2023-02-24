# Maintainer: Sameer Puri <aur@purisa.me>
pkgname=python-or-tools
pkgver=9.5
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python>=3.6' 'swig' 'python-protobuf>=3.19.4' 'absl-py' 'python-numpy>=1.13.3')
makedepends=('cmake' 'wget' 'lsb-release' 'automake' 'python-wheel' 'python-pip' 'git' 'python-mypy-protobuf')
optdepends=('cplex: CPLEX solver support' 'python-pandas: used by some examples' 'python-matplotlib: used by some examples')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
b2sums=('4052f36286258b6715b75dc577193f3d930febb56df5eeed02bf5f3a69f0d4bf73342b17c70ea44c93f4c955109bc5de31e2533d272bda98ea1f7d63987fe165')

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
