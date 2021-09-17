# Maintainer: Aleksander Mietinen <aleksander at mietinen dot net>

pkgname=seclists
pkgver=2021.3.1
pkgrel=1
pkgdesc="A collection of multiple types of lists used during security assessments, collected in one place."
arch=('any')
url="https://github.com/danielmiessler/SecLists"
license=('MIT')
makedepends=('findutils' 'coreutils' 'tar')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b0ec17b47fe8d4f06d3c7652d97c730545bb19f64ceec1fd23c0d9c2b8a50232')

prepare() {
    cd "$srcdir/SecLists-$pkgver"
    find . -iname "rockyou*.tar.gz" -exec sh -c 'tar zxf {} -C $(dirname {}); rm {}' \;
}

package() {
    cd "$srcdir/SecLists-$pkgver"

    # Install to /usr/share/seclists
    find . \( ! -iname "*.md" -a ! -iname ".git*" -a ! -name "LICENSE"  \) -type f \
        -exec install -Dm644 {} "$pkgdir/usr/share/$pkgname/{}" \;

    # Install all *.md files to /usr/share/doc/seclists
    find . -iname "*.md" -type f \
        -exec install -Dm644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;

    # Install LICENSE to /usr/share/licenses/seclists
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
