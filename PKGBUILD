# Maintainer: Mihai Bişog <mihai.bisog@gmail.com>
# Maintainer: Piotr Serafin <piotr.serafin.71@gmail.com>

pkgname=tsduck
_pkgver=3.20-1689
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc="An extensible toolkit for MPEG/DVB transport streams"
arch=('x86_64')
url="https://tsduck.io/"
license=('BSD')
depends=(pcsclite curl srt jq) 
source=("$pkgname-${_pkgver}.tar.gz::https://github.com/tsduck/tsduck/archive/v${_pkgver}.tar.gz")
md5sums=('3578a9bf9a61a26de3bdbabf9276409a')
install=$pkgname.install

build() {
    cd "$pkgname-${_pkgver}"
    make NOTEST=true
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
