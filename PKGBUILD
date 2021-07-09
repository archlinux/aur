# Maintainer: Cirk2 <privat+aur at cirk2 dot de> 

pkgname=sdbus-cpp-git
_pkgname=sdbus-cpp
pkgver=0.8.3.33.r261.d20210622.e16ffb1
pkgrel=1
epoch=2
pkgdesc="sdbus-c++ is a high-level C++ D-Bus library for Linux designed to provide expressive, easy-to-use API in modern C++"
url="https://github.com/Kistler-Group/sdbus-cpp"
arch=('i686' 'x86_64')
license=('LGPL2.1' 'custom:sdbus-c++ LGPL Exception 1.0')
depends=('systemd-libs' 'expat')
makedepends=('systemd' 'git' 'cmake' 'doxygen')
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  "${_pkgname}-${_pkgvariant}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-git"
  "${_pkgname}-${_pkgvariant}"
)
source=("${pkgname}::git+https://github.com/Kistler-Group/sdbus-cpp.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    _ver="$(git describe --tags | sed 's|^v||' | awk -F'-' '{print $1}')"
    _subver="$(git describe --tags | awk -F'-' '{print $2}')"
    _rev="$(git rev-list --count HEAD)"
    _hash="$(git rev-parse --short HEAD)"
    _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
    if [ -z ${_ver} ]; then
        error "Error in ${FUNCNAME[0]}: Version information could not determined."
        return 1
    fi
    printf '%s' "${_ver}.${_subver}.r${_rev}.d${_date}.${_hash}"
}

build() {
    cmake "$srcdir/${pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/ \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_CODE_GEN=ON \
        -DBUILD_DOXYGEN_DOC=ON
    make
    make doc
}

package() {
    make DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir/${pkgname}/COPYING-LGPL-Exception" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

