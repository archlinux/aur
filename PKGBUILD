# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=updfparser-git
pkgver=r33.6060d12344
pkgrel=2
pkgdesc="Very simple PDF parser"
arch=('any')
url="https://forge.soutade.fr/soutade/uPDFParser"
license=('LGPL-3.0-or-later')
provides=('updfparser')
conflicts=('updfparser')
makedepends=(
    'curl'
    'git'
)
depends=(
    'libgcc'
    'glibc'
    'libstdc++'    
)
source=("git+${url}.git")
# Variables required for humanity check
export GIT_CONFIG_COUNT=1
export GIT_CONFIG_KEY_0="http.extraHeader"
export GIT_CONFIG_VALUE_0="Cookie: $(/usr/bin/curl -s https://forge.soutade.fr/402.html | /usr/bin/sed -nE 's/.*document\.cookie = "([^;"]*).*/\1/p')"
sha256sums=('SKIP')

_srcdir="uPDFParser"

pkgver() {
    cd $_srcdir
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

build() {
    cd $_srcdir
    export CXXFLAGS+=" -std=c++17"
    make BUILD_STATIC=0 BUILD_SHARED=1
}

package() {
    install -Dm644 $_srcdir/include/*.h -t $pkgdir/usr/include/
    install -Dm644 $_srcdir/libupdfparser.so -t $pkgdir/usr/lib/
}

