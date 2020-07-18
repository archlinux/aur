# Maintainer: Piotr Serafin <piotr.serafin.71@gmail.com>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgname=tsduck
_pkgver=3.21-1819
pkgver=${_pkgver/-/_}
pkgrel=2
pkgdesc="An extensible toolkit for MPEG/DVB transport streams"
arch=('x86_64')
url="https://tsduck.io/"
license=('BSD')
depends=(pcsclite curl srt jq) 
source=("$pkgname-${_pkgver}.tar.gz::https://github.com/tsduck/tsduck/archive/v${_pkgver}.tar.gz")
md5sums=('887e678fd86b8916335e8a48ac037560')
install=$pkgname.install

build() {
    cd "$pkgname-${_pkgver}"
    make NOTEST=true
}

package() {
    cd "$pkgname-${_pkgver}"

    make SYSROOT="$pkgdir" install
    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p "$pkgdir/usr/lib"
    find "$pkgdir/usr/bin" -type f -name 'tsduck.so' -exec mv -t "$pkgdir/usr/lib" {} +

    # If pacman sees a /lib directory in a package, it will detect a conflict 
    # with the symlink on the filesystem. This uses /usr/lib directly.
    mkdir -p "$pkgdir/usr/lib/udev/rules.d"
    cp "$pkgdir/lib/udev/rules.d/80-tsduck.rules" "$pkgdir/usr/lib/udev/rules.d"
    rm -rf "$pkgdir/lib"

    mkdir -p "$pkgdir/usr/lib/$pkgname"
    find "$pkgdir/usr/bin" -type f -name 'tsplugin_*.so' -exec mv -t "$pkgdir/usr/lib/$pkgname" {} +
    find "$pkgdir/usr/bin" -type f -name 'tsduck.*.xml' -exec mv -t "$pkgdir/usr/lib/$pkgname" {} +
    find "$pkgdir/usr/bin" -type f -name 'tsduck.names' -exec mv -t "$pkgdir/usr/lib/$pkgname" {} +
    find "$pkgdir/usr/bin" -type f -name 'tsduck.oui.names' -exec mv -t "$pkgdir/usr/lib/$pkgname" {} +

    # When 3.22 will be released all above static resources will be installed in /usr/share/tsduck
    # mkdir -p "$pkgdir/usr/share/$pkgname"
    # find "$pkgdir/usr/bin" -type f -name 'tsduck.*.xml' -exec mv -t "$pkgdir/usr/share/$pkgname" {} +
    # find "$pkgdir/usr/bin" -type f -name 'tsduck.names' -exec mv -t "$pkgdir/usr/share/$pkgname" {} +
    # find "$pkgdir/usr/bin" -type f -name 'tsduck.oui.names' -exec mv -t "$pkgdir/usr/share/$pkgname" {} +

    mkdir -p "$pkgdir/etc/profile.d/"
    echo "export TSPLUGINS_PATH=/usr/lib/tsduck" > "$pkgdir/etc/profile.d/tsduck.sh"
}
