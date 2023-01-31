# Maintainer: Andre Soares <andregsilv at gmail dot com>
pkgname="mgrewe-openface-git"
pkgdesc="OpenFace – a state-of-the art tool intended for facial landmark detection, head pose estimation, facial action unit recognition, and eye-gaze estimation."
pkgver=2.2.0.r15.g912bfc03
pkgrel=3
arch=(x86_64)
license=("GPL")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" openface)
depends=(python)
makedepends=(cmake dlib opencv pybind11)
source=(
    'git+https://github.com/mgrewe/OpenFace.git'
)
sha256sums=('SKIP')
url="https://github.com/mgrewe/OpenFace"

pkgver() {
    cd ${srcdir}/OpenFace
    local version=$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
    echo ${version#OpenFace_}
}

prepare() {
    cd OpenFace
    git submodule update --init --recursive
}

build() {
    mkdir -p OpenFace/build
    cd OpenFace/build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    cmake --build . --config Release --parallel 4 --target FeatureExtractionPython
}

package() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    local outputdir=${pkgdir}${site_packages}/openface
    install -D ${srcdir}/OpenFace/build/bin/*.so ${outputdir}/openface.so
    install -D ${srcdir}/../__init__.py ${outputdir}/__init__.py
}
