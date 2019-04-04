# Maintainer: Eric Brandwein <brandweineric at gmail dot com>
# Contributor: 01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>
pkgname=clonehero
pkgver=0.22.2
pkgrel=1
pkgdesc="Clone of Guitar Hero and Rockband-style games"
arch=('x86_64')
url="https://clonehero.net/"
license=('freeware-proprietary')
install="$pkgname.install"
makedepends=('megacmd-bin')
depends=('gtk2')
source=("SHA1SUM"
        "$pkgname.install"
        "$pkgname.sh"
        "$pkgname.desktop")
_mega_source_url="https://mega.nz/#!LYMWTKCL!H0YV6PDwFZn_Z-6tpIRFVUoDRp7sw0lKNnDEtXKJf9w"
sha256sums=('b5f3ecfeb7f8c99d1e828607ad4d1153a177e5059ba317666056fe9598596e58'
            '01125237ef90f8435523fed5ae09246a76eb562408c50e76597964b5675385cf'
            'a985b5761bcc287c627184ea8947b50adf4e208d77e4bb65d15d3d604566c403'
            'a97d85930ac4844b3c5e90d4da8faa7a9b5267909d45be59b1fa39abc76df5fe')

prepare() {
    mega-get ${_mega_source_url}
    sha1sum --check SHA1SUM
    # Using -P because the tarball has file paths with relative imports.
    mkdir tmp
    mv $pkgname-linux.tar.gz tmp
    cd tmp
    tar -xzPvf $pkgname-linux.tar.gz
}

package() {
    install -dm755 "$pkgdir/opt/"
    cp -r "$srcdir/$pkgname-linux" "$pkgdir/opt/$pkgname"

    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +
    chmod +x "$pkgdir/opt/$pkgname/clonehero"

    # Install script, .desktop launcher with icon
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-linux/README.txt" "$pkgdir/usr/share/licenses/$pkgname/README.txt"
    install -Dm644 "$srcdir/$pkgname-linux/clonehero_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

