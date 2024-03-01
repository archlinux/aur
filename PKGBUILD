# Maintainer: Sameer Puri <aur@purisa.me>
pkgname=python-or-tools
pkgver=9.8
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python>=3.6' 'swig' 'python-protobuf>=3.19.4' 'absl-py' 'python-numpy>=1.13.3')
makedepends=('cmake' 'wget' 'lsb-release' 'automake' 'python-wheel' 'python-pip' 'git' 'python-mypy-protobuf' 'python-virtualenv')
optdepends=('cplex: CPLEX solver support' 'python-pandas: used by some examples' 'python-matplotlib: used by some examples')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz" "da02dfeac7f008cb7b30a5487add19401bd94b9e.patch")
b2sums=('03f94d016eb9d89227c98a70cf81af2d018fbadf5debe5dae3767d5ced3f772ecfcd8e00fcf2d4df32086e369d0c5f42700b854f4efb8ea3700b86774680b672' 'SKIP')

prepare() {
    patch --directory="${srcdir}/or-tools-${pkgver}" --forward --strip=1 --input="${srcdir}/da02dfeac7f008cb7b30a5487add19401bd94b9e.patch"
}

build() {
    cd "${srcdir}/or-tools-${pkgver}"
    if [ `pacman -Qi cplex &>/dev/null` ]; then
        cmake -S. -Bbuild -DBUILD_PYTHON:BOOL=ON -DBUILD_CXX_SAMPLES=OFF -DBUILD_CXX_EXAMPLES=OFF -DUSE_CPLEX:BOOL=ON -DCPLEX_ROOT=/usr/lib/cplex
    else
	cmake -S. -Bbuild -DBUILD_PYTHON:BOOL=ON -DBUILD_CXX_SAMPLES=OFF -DBUILD_CXX_EXAMPLES=OFF
    fi
    cmake --build build -j --config Release --target all
}

package() {
    cd "${srcdir}/or-tools-${pkgver}"
    /usr/bin/pip --quiet install --root="$pkgdir" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(find -name 'ortools*whl')"
}
