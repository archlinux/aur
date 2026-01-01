# Maintainer: Thomas Touhey <thomas@touhey.fr>
_pkgname=cahute
pkgname=mingw-w64-$_pkgname-git
pkgver=0.6
pkgrel=2
pkgdesc="A toolkit to handle communication and file formats related to CASIO calculators (mingw-w64)"
url="https://next.cahuteproject.org"
arch=('any')
license=('custom:CeCILL')
depends=('mingw-w64-crt')
makedepends=('git' 'mingw-w64-cmake' 'python' 'python-toml')
provides=("mingw-w64-cahute")
conflicts=("mingw-w64-cahute")
options=('!buildflags' '!strip')
source=("git+https://gitlab.com/cahute/cahute.git")
b2sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    for _arch in ${_architectures}; do
        ${_arch}-cmake -S $_pkgname -B build/${_arch} \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
            -DCAHUTE_CLI=OFF

        cmake --build build/${_arch}
    done
}

package() {
    for _arch in ${_architectures}; do
        DESTDIR="$pkgdir" cmake --install build/${_arch} --strip
    done

    install -Dm644 "$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
