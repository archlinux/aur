# Maintainer: Max Mertens <max.mail@dameweb.de>

pkgbase=structstore
pkgname=(structstore structstore_py)
pkgver=0.5.0
pkgrel=1
pkgdesc='Structured object storage, dynamically typed, to be shared between processes'
arch=('x86_64' 'aarch64')
url='https://github.com/mertemba/structstore'
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs' 'yaml-cpp')
makedepends=('cmake' 'ninja' 'gcc' 'yaml-cpp' 'python' 'python-pip')
source=("git+https://github.com/mertemba/structstore.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
    cd "$pkgbase"
    # cutting off 'v' prefix that presents in the git tag
    git describe --long --tags --abbrev=7 --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgbase}"
    venvdir="${srcdir}/venv"
    python -m venv "${venvdir}"
    source "${venvdir}/bin/activate"
    pip install -r requirements.txt
    cmake -B build -S "." \
        -G Ninja \
        -DBUILD_WITH_PYTHON=ON \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    # ctest --test-dir build --output-on-failure
    true
}

package_structstore() {
    provides+=('libstructstore.so')

    cd "${srcdir}/${pkgbase}"
    venvdir="${srcdir}/venv"
    source "${venvdir}/bin/activate"
    DESTDIR="$pkgdir" cmake --install build

    # keep only non-Python files
    find "$pkgdir" -type f | sed "s@$pkgdir@@" \
        | grep -i -e py -e nanobind -e binding \
        | while IFS='' read f; do rm "$pkgdir/$f"; done
    find "$pkgdir" -type d -empty -delete
}

package_structstore_py() {
    depends+=('python' 'structstore')

    cd "${srcdir}/${pkgbase}"
    venvdir="${srcdir}/venv"
    source "${venvdir}/bin/activate"
    DESTDIR="$pkgdir" cmake --install build

    # keep only Python files
    find "$pkgdir" -type f | sed "s@$pkgdir@@" \
        | grep -i -v -e py -e nanobind -e binding \
        | while IFS='' read f; do rm "$pkgdir/$f"; done
    find "$pkgdir" -type d -empty -delete
}
