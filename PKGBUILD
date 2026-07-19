# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin at gmail dot com>
# Cotributor: Davorin Učakar <davorin dot ucakar at gmail dot com>

_pkgname="libsquish"
pkgname="lib32-$_pkgname"
pkgver=1.15
pkgrel=4
pkgdesc="DXT compression library (32-bit)"
arch=('x86_64')
url="https://sourceforge.net/projects/libsquish"
license=('MIT')
depends=(
    "${_pkgname}>=${pkgver}"
    'lib32-gcc-libs'
    'lib32-glibc'
)
makedepends=('setconf')
_pkgsrc="${_pkgname}-${pkgver}"
source=("https://downloads.sourceforge.net/project/${_pkgname}/${_pkgsrc}.tgz")
noextract=("${_pkgsrc}.tgz")
b2sums=('d2cdf274baf9cf8890ee4c5c434448a34bc6d3d8967df6e2e9334fe1eff66ce5371597396c564c80a128709a8849f1f622d90aaf470eacc1ad67811cef38bd60')

prepare() {
    mkdir -p "$_pkgsrc"
    bsdtar xzf "$_pkgsrc.tgz" -C "$_pkgsrc"

    cd "$_pkgsrc"
    setconf config USE_OPENMP 0
    setconf config USE_SHARED 1
    setconf config USE_SSE 1
    setconf libsquish.pc.in Version "$pkgver"
}

build() {
    export CFLAGS+=" -m32"
    export CXXFLAGS+=" -m32"
    export LDFLAGS+=" -m32"
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cd "$srcdir/$_pkgsrc"

    make PREFIX='/usr' LIB_PATH='lib32'
}

package() {
    cd "$srcdir/$_pkgsrc"

    make INSTALL_DIR="$pkgdir/usr" \
        LIB_PATH='lib32' \
        install

    cd "$pkgdir/usr"
    rm -rf "bin" "include" "share"
    install -Dm644 "$srcdir/$_pkgsrc/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
