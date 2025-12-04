# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>

_pkgname="libmsym"
pkgname="${_pkgname}-git"
pkgver=0.2.3.r199.85e4723
pkgrel=1
pkgdesc="Molecular point group symmetry lib (git version)"
arch=("x86_64")
url="https://github.com/mcodev31/libmsym"
license=("MIT")
depends=("glibc")
makedepends=("git" "cmake" "python-setuptools")
optdepends=("python: Python bindings")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    _parent_ver=$(git describe --tags --abbrev=0 | sed 's/\([^-]*-\)g/r\1/;s/-//g' | tr -d '[:alpha:]' )
    printf "%s.r%s.%s" \
           "${_parent_ver}" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

build() {
    cmake \
        -B build \
        -S "$pkgname" \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DBUILD_SHARED_LIBS:BOOL=ON \
        -DMSYM_BUILD_EXAMPLES:BOOL=OFF \
        -DMSYM_BUILD_PYTHON:BOOL=ON \
        -DMSYM_PYTHON_INSTALL_OPTS:STRING="--root=${pkgdir}" \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
