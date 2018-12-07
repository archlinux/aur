# Maintainer: Mihai Bişog <mihai.bisog@gmail.com>

pkgname=tsduck
_pkgver=3.15-1008
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc="An extensible toolkit for MPEG/DVB transport streams"
arch=('x86_64')
url="https://tsduck.io/"
license=('BSD')
depends=(curl pcsclite)
makedepends=(cppunit)
source=("$pkgname-${_pkgver}.tar.gz::https://github.com/tsduck/tsduck/archive/v${_pkgver}.tar.gz")
md5sums=("65b05c93432b2274d38ea2ed65d0d388")
install=$pkgname.install

prepare() {
    cd "$pkgname-${_pkgver}"
    make unixify
    make dtapi
}

build() {
    cd "$pkgname-${_pkgver}"
    make
}

check() {
    cd "$pkgname-${_pkgver}"
    make test
}

package() {
    cd "$pkgname-${_pkgver}"

    make SYSROOT="$pkgdir" install install-devel
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

    local TSPLUGINS_PATH="/usr/lib/tsduck/plugins"
    mkdir -p "$pkgdir/$TSPLUGINS_PATH"
    find "$pkgdir/usr/bin" -type f -name 'tsplugin_*.so' -exec mv -t "$pkgdir/$TSPLUGINS_PATH" {} +

    mkdir -p "$pkgdir/etc/profile.d/"
    echo "export TSPLUGINS_PATH=/${TSPLUGINS_PATH}" > "$pkgdir/etc/profile.d/tsduck.sh"
}
